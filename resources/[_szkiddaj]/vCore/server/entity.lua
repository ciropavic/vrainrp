Entities                        = {}; -- Entity[]
EntityRefs                      = {}; -- { [key: EntityType]: EntityId[] }

EntityConstructors              = {}; -- pretty self-explanatory
EntityDestructors               = {}; -- same ^^^
EntityClientEvents              = {}; -- Events coming from client that should be handled by FiveM, but they incompetent fucks.. (and still get $400k of patreons lol)
EntityExtensions                = {}; -- Extends the default entity "class" with methods and properties
EntitySharedInternalKeys        = {}; -- Internal data keys which will be shared with the clients. { [key: EntityType]: { [key: string]: boolean } }
EntityInternalEvents            = {}; -- Run's when an entity's internal value changes (like dimension changes)

EntityGloballySharedKeys        = {   -- The keys below will be shared with the clients regardless of the entity's type.
    position = true, 
    dimension = true
};

local EntityIndex               = 0;
local SharedEntitiesRefs        = {}; -- Entity IDs of broadcasted entities to the clients.
local InitializedClients        = {}; -- { [key: PlayerId]: Entity }

function Entity(...)
    local self = {};

    self.__initialize = function(newEntity)
        if (not newEntity or not newEntity.type) then 
            return false;
        end 

        self.id                     = EntityIndex;
        EntityIndex                 += 1;

        self.__type                 = newEntity.type;
        self.__resource             = newEntity.parentResource;
        self.__meta                 = {};
        self.__events               = {};
        self.__internalShared       = { dimension = 0 };
        self.__broadcast            = (newEntity.type == "player" or newEntity.broadcast ~= false);

        if (EntityConstructors[newEntity.type]) then 
            local isValid = EntityConstructors[newEntity.type](self, table.unpack(newEntity.__to_constructor));

            if (isValid == false) then 
                return self.destroy();
            end 
        end 

        if (EntityExtensions[self.__type]) then 
            for k, v in pairs(EntityExtensions[self.__type]) do 
                if (type(v) == "function") then 
                    self[k] = function(...) return v(self, ...); end;
                end 
            end 
        end 

        if (self.__broadcast) then 
            table.insert(SharedEntitiesRefs, self.id);

            local sharedEntityData = {
                netId               = self.__netId, 
                type                = self.__type, 
                meta                = { },
                shared              = { }, 
                toConstructor       = { },
            };

            for key, value in pairs(self.__internalShared) do 
                if (
                    EntityGloballySharedKeys[key] == true or 
                    (
                        EntitySharedInternalKeys[self.__type] and 
                        EntitySharedInternalKeys[self.__type][key] == true
                    )
                ) then 
                    sharedEntityData.shared[key] = self.__internalShared[key];
                end 
            end 

            for _, playerId in ipairs(GetPlayers()) do 
                playerId = tonumber(playerId);

                if (InitializedClients[playerId]) then 
                    TriggerClientEvent("vCore::internal::CreateEntity", playerId, self.id, sharedEntityData);
                end 
            end 
        end 

        iprint("Entity " .. self.id .. " (" .. self.__type .. ") created.");

        if (not EntityRefs[self.__type]) then 
            EntityRefs[self.__type] = {};
        end 

        table.insert(EntityRefs[self.__type], self.id);
        Entities[self.id] = self;

        TriggerEvent("onEntityCreated", self);
        return self;
    end 

    self.destroy = function()
        local entityId = self.id;
        debug("SERVER_ENTITY_START_DESTROY", entityId);

        if (
            self.__type and 
            self.id and 
            EntityRefs[self.__type] and
            EntityRefs[self.__type][self.id]
        ) then 
            EntityRefs[self.__type][self.id] = nil;
        end 

        if (EntityDestructors[self.__type]) then 
            EntityDestructors[self.__type](self);
        end 

        for index, entityRefId in ipairs(SharedEntitiesRefs) do 
            if (entityRefId == entityId) then
                table.remove(SharedEntitiesRefs, index);
                break;
            end 
        end 

        TriggerClientEvent("vCore::internal::DestroyEntity", -1, self.id);
        debug("SERVER_ENTITY_START_DESTROYED", self.id);

        for k,v in pairs(self) do 
            self[k] = nil;
        end 

        self = nil;
        Entities[entityId] = nil;
        collectgarbage("collect");
    end

    self.setMeta = function(key, newValue)
        debug("SERVER_ENTITY_META_CHANGE_START", self.__netId, key, newValue);
        if (
            not key or 
            (
                type(key) ~= 'string' and 
                type(key) ~= 'number'
            )
        ) then 
            debug("SERVER_ENTITY_META_CHANGE_INVALID", self.__netId, key, newValue);
            return false;
        end 

        local oldValue = self.getMeta(key);
        local canceled = self.__emit("onMetaChange", key, oldValue, newValue);
        if (not canceled) then
            self.__meta[key] = { value = newValue, __type = "server" };
            TriggerEvent("onMetaChangeOnAnyEntity", self, key, oldValue, newValue);
            debug("SERVER_ENTITY_META_CHANGE_FINISHED", self.__netId, key, newValue);
            return true;
        else 
            debug("SERVER_ENTITY_META_CHANGE_CANCELED", self.__netId, key, newValue);
            return false;
        end 
    end 
    
    self.setLocalMeta = function(key, newValue)
        debug("SERVER_ENTITY_LOCALMETA_CHANGE_START", self.__netId, key, newValue);
        if (
            not key or 
            (
                type(key) ~= 'string' and 
                type(key) ~= 'number'
            )
        ) then 
            debug("SERVER_ENTITY_LOCALMETA_CHANGE_INVALID", self.__netId, key, newValue);
            return false;
        end 

        local oldValue = self.getMeta(key);
        local canceled = self.__emit("onMetaChange", key, oldValue, newValue);
        if (not canceled) then
            self.__meta[key] = { value = newValue, __type = "local" };

            if (self.__netId and self.__type == "player") then 
                self.triggerEvent("vCore::internal::SetEntityMeta", self.id, key, newValue);
            end 

            TriggerEvent("onMetaChangeOnAnyEntity", self, key, oldValue, newValue);
            debug("SERVER_ENTITY_LOCALMETA_CHANGE_FINISHED", self.__netId, key, newValue);
            return true;
        else 
            debug("SERVER_ENTITY_LOCALMETA_CHANGE_CANCELED", self.__netId, key, newValue);
            return false;
        end 
    end
    
    self.setSharedMeta = function(key, newValue)
        debug("SERVER_ENTITY_SHAREDMETA_CHANGE_START", self.__netId, key, newValue);

        if (
            not key or 
            (
                type(key) ~= 'string' and 
                type(key) ~= 'number'
            )
        ) then 
            debug("SERVER_ENTITY_SHAREDMETA_CHANGE_INVALID", self.__netId, key, newValue);
            return false;
        end 
        
        local oldValue = self.getMeta(key);
        local canceled = self.__emit("onMetaChange", key, oldValue, newValue);
        if (not canceled) then
            self.__meta[key] = { value = newValue, __type = "shared" };
            
            for id, player in ipairs(getEntitiesByType("player")) do 
                player.triggerEvent("vCore::internal::SetEntityMeta", self.id, key, newValue);
            end 

            TriggerEvent("onMetaChangeOnAnyEntity", self, key, oldValue, newValue);
            debug("SERVER_ENTITY_SHAREDMETA_CHANGE_FINISHED", self.__netId, key, newValue);
            return true;
        else 
            debug("SERVER_ENTITY_SHAREDMETA_CHANGE_CANCELED", self.__netId, key, newValue);
            return false;
        end 
    end 

    self.getMeta = function(key)
        return (key and (type(key) == "string" or type(key) == "number") and self.__meta[key] ~= nil)
                and self.__meta[key].value
                or nil;
    end 

    self.getMetaType = function(key)
        return (key and (type(key) == "string" or type(key) == "number") and self.__meta[key] ~= nil)
                and self.__meta[key].__type
                or false;
    end 

    self.__emit = function(event, ...)
        local result;
        debug("SERVER_ENTITY_EMIT_START", self.__netId, event, ...);
        
        if (
            type(event) == "string" and 
            self.__events[event]
        ) then 
            for pointer, handler in pairs(self.__events[event]) do 
                debug("SERVER_ENTITY_EMIT_DONE", self.__netId, event, ...);
                result = handler(self, ...);
            end 
        end 

        return (type(result) == "boolean" and result == false);
    end 

    self.on = function(event, handler)
        debug("SERVER_ENTITY_ADD_EVENT_START", self.__netId, event);

        if (type(event) ~= "string" or type(handler) ~= "function") then 
            debug("SERVER_ENTITY_ADD_EVENT_INVALID", self.__netId, event, type(event) ~= "string", type(handler) ~= "function");
            return false;
        end 

        if (not self.__events[event]) then 
            self.__events[event] = {};
        end 

        debug("SERVER_ENTITY_ADD_EVENT_DONE", self.__netId, event);
        self.__events[event][tostring(handler)] = handler;
        return true;
    end 

    self.off = function(event, handler)
        debug("SERVER_ENTITY_REMOVE_EVENT_START", self.__netId, event);
        if (
            type(event) == "string" and 
            self.__events[event] and 
            self.__events[event][tostring(handler)]
        ) then  
            debug("SERVER_ENTITY_REMOVE_EVENT_DONE", self.__netId, event);
            self.__events[event][tostring(handler)] = nil;
        end 
    end 

    self.setCoords = function(x, y, z, xAxis, yAxis, zAxis, clearArea)
        local nativeEntity = (self.__type == "player")
                    and GetPlayerPed(self.__netId)
                    or self.__netId;

        SetEntityCoords(
            nativeEntity, x + 0.0, y + 0.0, z + 0.0, 
            xAxis or false, yAxis or false, zAxis or false, 
            clearArea or false
        );
    end 

    self.getCoords = function()
        return GetEntityCoords(
            (self.__type == "player")
                and GetPlayerPed(self.__netId)
                or self.__netId
        );
    end 

    self.setInternalData = function(dataKey, newValue, shouldSync)
        if (shouldSync == nil) then 
            shouldSync = false;
        end 

        assert(type(dataKey) == "string" or type(dataKey) == "number", "Bad argument @ '" .. self.__type .. ".setInternalData', expected string or number at argument 1, got '" .. type(dataKey) .. "'");
        assert(type(shouldSync) == "boolean", "Bad argument @ '" .. self.__type .. ".setInternalData', expected boolean at argument 1, got '" .. type(shouldSync) .. "'");

        debug(
            "SERVER_ENTITY_INTERNAL_DATA_CHANGE", 
            "key: " .. tostring(dataKey), "old: " .. tostring(self.__internalShared[dataKey]), 
            "new: " .. tostring(newValue), "shouldSync: " .. tostring(shouldSync)
        );

        if (
            EntityInternalEvents[self.__type] and 
            type(EntityInternalEvents[self.__type][dataKey]) == "function"
        ) then 
            local result = EntityInternalEvents[self.__type][dataKey](self, dataKey, newValue, shouldSync);

            if (type(result) == "boolean" and result == false) then 
                debug(
                    "SERVER_ENTITY_INTERNAL_DATA_CHANGE_INTERCEPTED", 
                    "key: " .. tostring(dataKey)
                );

                return false;
            end 
        end 

        self.__internalShared[dataKey] = newValue;

        if (type(shouldSync) == "boolean" and shouldSync == true) then
            for playerId, entity in pairs(InitializedClients) do 
                TriggerClientEvent("vCore::internal::SetInternalData", playerId, self.id, dataKey, newValue);
            end 
        end 
    end

    self.getInternalData = function(dataKey)
        assert(type(dataKey) == "string" or type(dataKey) == "number", "Bad argument @ '" .. self.__type .. ".setInternalData', expected string or number at argument 1, got '" .. type(dataKey) .. "'");

        return self.__internalShared[dataKey];
    end

    return self.__initialize(...);
end 

addFetch("clientInitialized", function(playerId, callback)
    debug("SERVER_ENTITY_CLIENT_INITIALIZING", playerId);
    if (InitializedClients[playerId]) then 
        debug("SERVER_ENTITY_CLIENT_ALREADY_EXISTING", playerId);
        return;
    end 

    InitializedClients[playerId] = Entity({
        type = "player", 
        __to_constructor = { playerId },
    });;

    local fetchedEntities = {};
    for i, entityId in ipairs(SharedEntitiesRefs) do 
        if (
            Entities[entityId] ~= nil and 
            Entities[entityId].__broadcast
        ) then
            local entity = Entities[entityId];

            fetchedEntities[entity.id] = {
                type                    = entity.__type, 
                netId                   = entity.__netId, 
                meta                    = table.map_keytbl(entity.__meta, function(x) return x.value; end), 
                shared                  = {}
            };
            
            for key, value in pairs(entity.__internalShared) do 
                if (
                    EntityGloballySharedKeys[key] == true or 
                    (
                        EntitySharedInternalKeys[entity.__type] and 
                        EntitySharedInternalKeys[entity.__type][key] == true
                    )
                ) then 
                    fetchedEntities[entity.id]['shared'][key] = entity.__internalShared[key];
                end 
            end 
        end
    end 

    debug("SERVER_ENTITY_CLIENT_INITIALIZED", playerId, fetchedEntities);

    callback({ entities = fetchedEntities });
end);

AddEventHandler("playerDropped", function()
    local playerId = source;

    debug("SERVER_ENTITY_CLIENT_DROPPED", playerId);

    for id, entity in pairs(Entities) do 
        if (entity.__netId == playerId) then 
            entity.destroy();
            print("player's " .. playerId .. " entity destroyed.");
            return;
        end 
    end 
end);

AddEventHandler("onResourceStop", function(resourceName)
    if (resourceName == GetCurrentResourceName()) then 
        for id, entity in pairs(Entities) do 
            entity.destroy();
            Entities[id] = nil;
        end 

        Entities = nil;
    else 
        for id, entity in pairs(Entities) do 
            if (
                type(entity.__resource) == "string" and 
                entity.__resource == resourceName
            ) then 
                entity.destroy();
                Entities[id] = nil;
            end 
        end 
    end 
end);