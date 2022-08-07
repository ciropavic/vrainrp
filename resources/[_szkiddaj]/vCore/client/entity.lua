Entities                        = {}; -- Entity[]
EntityRefs                      = {}; -- { [key: EntityType]: { [key: Id]: Entity } }

EntityConstructors              = {}; -- pretty self-explanatory
EntityDestructors               = {}; -- same ^^^
EntityExtensions                = {}; -- Extends the default entity "class" with methods and properties
EntityInternalEvents            = {}; -- Run's when an entity's internal value changes (like dimension changes)

local EntityIndex               = -1000; -- Entity IDs below 0 is client created.

function Entity(...)
    local self = {};

    self.__initialize = function(newEntity)
        if (not newEntity or not newEntity.type) then 
            self = nil;
            return false;
        end 

        local id = (newEntity.serverId ~= nil) and newEntity.serverId or EntityIndex;
        if (id > -1 and Entities[id]) then 
            self = nil;
            return false;
        end 

        self.id = id;
        if (not newEntity.serverId) then
            EntityIndex -= 1;
        end 

        self.__netId                = newEntity.netId;
        self.__type                 = newEntity.type;
        self.__fromServer           = newEntity.fromServer;
        self.__internalShared       = newEntity.shared;
        self.__meta                 = {};
        self.__events               = {};

        if (EntityConstructors[newEntity.type]) then 
            EntityConstructors[newEntity.type](self);
        end 

        if (newEntity.fromServer and newEntity.meta) then 
            self.__meta = table.map_keytbl(newEntity.meta, function(x)
                return { value = x, isLocal = false };
            end);
        end 

        if (EntityExtensions[self.__type]) then 
            for k, v in pairs(EntityExtensions[self.__type]) do 
                if (type(v) == "function") then 
                    self[k] = function(...) return v(self, ...); end;
                end 
            end 
        end 

        iprint("Entity " .. self.id .. " (" .. self.__type .. ") created.");

        if (not EntityRefs[self.__type]) then 
            EntityRefs[self.__type] = {};
        end 

        table.insert(EntityRefs[self.__type], self.id);

        Entities[self.id] = self;
        TriggerEvent("onClientEntityCreated", self);
        return self;
    end 

    self.destroy = function(byServer)        
        TriggerEvent("onClientEntityDestroyed", self);
        
        local entityId = self.id;
        
        if (EntityDestructors[self.__type]) then 
            EntityDestructors[self.__type](self);
        end 
        
        for k,v in pairs(self) do 
            self[k] = nil;
        end 
        
        self = nil;
        Entities[entityId] = nil;
        collectgarbage("collect");
    end

    self.setMeta = function(key, newValue, isLocal)
        debug("ENTITY_META_SET_START", key, newValue, isLocal);
        
        if (
            not key or 
            (
                type(key) ~= 'string' and 
                type(key) ~= 'number'
            )
        ) then 
            debug("ENTITY_META_SET_INVALID", key, newValue, isLocal);
            return false;
        end 
        
        local oldValue = self.getMeta(key);
        local canceled = self.__emit("onClientMetaChange", not isLocal, key, oldValue, newValue);
        if (not canceled) then
            TriggerEvent("onClientMetaChangeOnAnyEntity", self, key, oldValue, newValue, not isLocal);
            debug("ENTITY_META_SET_DONE", key, newValue, isLocal);

            if (newValue == nil) then 
                self.__meta[key] = nil;
            else 
                self.__meta[key] = { value = newValue, isLocal = isLocal };
            end

            return true;
        else 
            debug("ENTITY_META_SET_CANCELED", key, newValue, isLocal);
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

    self.__emit = function(event, ignoreCancel, ...)
        local eventArgs = { ... };

        debug("ENTITY_EMIT_START", event, ignoreCancel);
        if (
            type(event) == "string" and 
            self.__events[event]
        ) then 
            debug("ENTITY_EMIT_VALID", event, ignoreCancel);

            for pointer, handler in pairs(self.__events[event]) do 
                local success, result = pcall(function() handler(self, table.unpack(eventArgs)); end);

                if (
                    not ignoreCancel and
                    type(result) == "boolean" and 
                    result == false
                ) then 
                    debug("ENTITY_EMIT_RESULT3", result, ignoreCancel);
                    return true;
                end 
            end 
        end 

        return false;
    end 

    self.on = function(event, handler)
        debug("ENTITY_ADD_EVENT_START", event);
        if (
            type(event) ~= "string" or 
            (
                type(handler) ~= "function" and 
                (type(handler) ~= "table" or not handler['__cfx_functionReference'])
            )
        ) then 
            debug("ENTITY_ADD_EVENT_INVALID", event);
            return false;
        end 
        
        if (not self.__events[event]) then 
            self.__events[event] = {};
        end 
        
        local handlerId = (type(handler) == "table") and handler['__cfx_functionReference'] or tostring(handler);
        self.__events[event][handlerId] = handler;

        debug("ENTITY_ADD_EVENT_DONE", event);
        return true;
    end 

    self.off = function(event, handler)
        local handlerId = (type(handler) == "table") and handler['__cfx_functionReference'] or tostring(handler);
        if (
            type(event) == "string" and 
            self.__events[event] and 
            self.__events[event][handlerId]
        ) then  
            debug("ENTITY_REMOVE_EVENT_DONE", event);
            self.__events[event][handlerId] = nil;
        end 
    end 

    self.setInternalData = function(dataKey, newValue)
        assert(type(dataKey) == "string" or type(dataKey) == "number", "Bad argument @ '" .. self.__type .. ".setInternalData', expected string or number at argument 1, got '" .. type(dataKey) .. "'");
        assert(type(shouldSync) == "boolean", "Bad argument @ '" .. self.__type .. ".setInternalData', expected boolean at argument 1, got '" .. type(shouldSync) .. "'");

        if (
            EntityInternalEvents[self.__type] and 
            type(EntityInternalEvents[self.__type][dataKey]) == "function"
        ) then 
            local result = EntityInternalEvents[self.__type][dataKey](self, dataKey, newValue);

            if (type(result) == "boolean" and result == false) then 
                return false;
            end 
        end 

        self.__internalShared[dataKey] = newValue;
    end

    self.getInternalData = function(dataKey)
        assert(type(dataKey) == "string" or type(dataKey) == "number", "Bad argument @ '" .. self.__type .. ".setInternalData', expected string or number at argument 1, got '" .. type(dataKey) .. "'");

        return self.__internalShared[dataKey];
    end

    self.isLocalPlayer = function()
        return (self.__type == "player" and GetPlayerServerId(PlayerId()) == self.__netId);
    end 

    return self.__initialize(...);
end 

local __LocalPlayerEntityPointer;
function getLocalPlayer()
    if (not __LocalPlayerEntityPointer) then 
        for id, entity in pairs(Entities) do 
            if (
                entity.__type == "player" and 
                entity.__netId == GetPlayerServerId(PlayerId())
            ) then 
                __LocalPlayerEntityPointer = id;
                return entity;
            end 
        end 
    else 
        return Entities[__LocalPlayerEntityPointer];
    end 

    return nil;
end 
exports("getLocalPlayer", getLocalPlayer);

RegisterNetEvent("vCore::internal::CreateEntity");
AddEventHandler("vCore::internal::CreateEntity", function(entityId, newEntity)
    local entity = Entity({
        serverId        = entityId, 
        fromServer      = true, 
        netId           = newEntity.netId, 
        type            = newEntity.type, 
        shared          = newEntity.shared,
        meta            = newEntity.meta, 
        toConstructor   = { (newEntity.toConstructor or { }) }
    });

    debug("ENTITY_CREATE", entityId, newEntity, entity);
end);

RegisterNetEvent("vCore::internal::DestroyEntity");
AddEventHandler("vCore::internal::DestroyEntity", function(entityId)
    if (entityId and Entities[entityId]) then 
        Entities[entityId].destroy();
    end 
end);

RegisterNetEvent("vCore::internal::SetEntityMeta");
AddEventHandler("vCore::internal::SetEntityMeta", function(entityId, key, value)
    if (Entities[entityId]) then 
        if (Entities[entityId].setMeta(key, value, false)) then 
            debug("ENTITY_META_SERVER_SUCCESS", entityId, key, value);
        else 
            debug("ENTITY_META_SERVER_FAILED", entityId, key, value);
        end 
    else
        debug("ENTITY_META_SERVER_NOT_EXISTS", entityId, key, value);
    end 
end);

RegisterNetEvent("vCore::internal::InvokeNative");
AddEventHandler("vCore::internal::InvokeNative", function(entityId, nativeAddress, ...)
    if (Entities[entityId] and Entities[entityId].invokeNative ~= nil) then 
        Entities[entityId].invokeNative(nativeAddress, ...);
    end 
end);

RegisterNetEvent("vCore::internal::SetInternalData");
AddEventHandler("vCore::internal::SetInternalData", function(entityId, dataKey, newValue)
    if (Entities[entityId]?.__internalShared) then 
        local entity = Entities[entityId];

        if (
            EntityInternalEvents[entity.__type] and 
            type(EntityInternalEvents[entity.__type][dataKey]) == "function"
        ) then 
            EntityInternalEvents[entity.__type][dataKey](entity, entity.__internalShared[dataKey], newValue);
        end 

        entity.__internalShared[dataKey] = newValue;
    end 
end);

-- RegisterNetEvent("vCore::internal::DestroyEntity");
-- AddEventHandler("vCore::internal::DestroyEntity", function(entityId)
--     if (Entities[entityId]) then 
--         DestroyEntity(entityId);
--     end 
-- end);

Citizen.CreateThread(function()
    debug("ENTITY_SYNC_START");
    
    useFetchAsync(
        "clientInitialized", 
        function(data)
            local entities = data.entities;
            
            for id, entity in pairs(entities) do 
                Entity({
                    serverId        = id, 
                    fromServer      = true, 
                    netId           = entity.netId, 
                    type            = entity.type, 
                    meta            = entity.meta, 
                    shared          = entity.shared
                });
            end 

            IS_READY = true;

            debug("ENTITY_SYNC_DONE", entities);
        end
    );
end);