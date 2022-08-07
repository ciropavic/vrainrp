assert(load(exports.vCore:require({ "identifier" })))();

function parsePlayerSteamId(player)
    local identifiers = GetPlayerIdentifiers(player);
    
    if (identifiers?.license and identifiers?.steam) then 
        MySQL.update(
            'UPDATE users SET steam_id = ? WHERE identifier = ? LIMIT 1', 
            { identifiers.steam, identifiers.license }, 
            function(affectedRows)
                if (affectedRows) then

                end
            end
        );
    end 
end 

AddEventHandler("esx:playerLoaded", function(player, xPlayer, isNew)
    parsePlayerSteamId(player);
end);

local szarfosauto = {
    ["emperor"] = 1500,
    ["retinue2"] = 10000,
    ["skyline"] = 160000,
    ["g63"] = 275000,
    ["peyote3"] = 9500,
    ["raptor2017"] = 160000,
    ["bobcatxl"] = 25000,
    ["nightblade"] = 50000,
    ["sanctus"] = 70000,
    ["rs7"] = 180000,
    ["bison"] = 40000,
    ["gtr"] = 180000,
    ["seminole2"] = 40000,
    ["ARG"] = 200000,
    ["sim22"] = 250000,
    ["x6m"] = 185000,
    ["370z"] = 160000,
    ["rmodbentley1"] = 350000,
    ["michelli"] = 10000,
    ["mgt"] = 200000,
    ["pts21"] = 220000,
    ["manchez"] = 8000,
    ["rmodmartin"] = 250000,
    ["rmodmk7"] = 220000,
    ["m3e46"] = 140000,
    ["evo10"] = 170000,
    ["dynasty"] = 12000,
    ["rmodgt63"] = 400000,
    ["evoque"] = 95000,
    ["rmodbmwm8"] = 300000,
    ["rmodrs6"] = 335000,
    ["brioso"] = 10000,
    ["r8ppi"] = 250000,
    ["17ram3500"] = 200000,
    ["Q7"] = 100000,
    ["mesa"] = 35000,
    ["issi3"] = 4000,
    ["rmodm4gts"] = 300000,
    ["glendale2"] = 16000,
    ["aventador"] = 220000,
    ["weevil"] = 2000,
    ["bjxl"] = 50000,
    ["golfgti"] = 75000,
    ["chevelle67"] = 150000,
    ["warrener"] = 5500,
    ["kanjo"] = 5500,
    ["cayenne18"] = 140000,
    ["gburrito2"] = 60000,
    ["patriot"] = 150000,
}

local masikszarfos = exports.skvehicleshop:getAllVehicles();

-- Citizen.CreateThread(function()
--     local vehicleData = {}; -- [key: Hash]: price

--     for k,v in pairs(szarfosauto) do vehicleData[GetHashKey(k)] = v; end 
--     for i,v in ipairs(masikszarfos) do vehicleData[GetHashKey(v.model)] = v.price; end 

--     local removedVehicles = {};

--     local vehicleOwners = {};
--     local moneyToOwner = {};

--     local result = MySQL.query.await("SELECT id, owner, vehicle FROM owned_vehicles", { });
--     for i,v in ipairs(result) do 
--         local veh = json.decode(v.vehicle);
--         if (veh and vehicleData[veh.model]) then 
--             if (not moneyToOwner[v.owner]) then 
--                 table.insert(vehicleOwners, v.owner);
--                 moneyToOwner[v.owner] = 0;
--             end 

--             moneyToOwner[v.owner] = moneyToOwner[v.owner] + vehicleData[veh.model];
--             table.insert(removedVehicles, v.id);
--         end 
--     end 

--     MySQL.query("SELECT identifier, accounts FROM users WHERE identifier IN ('" .. table.concat(vehicleOwners, "', '") .. "')", {  }, function(result)
--         for i,v in ipairs(result) do 
--             if (moneyToOwner[v.identifier]) then 
--                 local accounts = json.decode(v.accounts);
--                 local newMoney = accounts.bank + moneyToOwner[v.identifier];

--                 accounts.bank = newMoney;

--                 MySQL.execute("UPDATE users SET accounts = ? WHERE identifier = ?", { json.encode(accounts), v.identifier });
--             end 
--         end 
--     end);

--     exports.vCore:iprint(removedVehicles)
--     MySQL.query("DELETE FROM owned_vehicles WHERE id IN (" .. table.concat(removedVehicles, ", ") ..  ")", { }, function(...)
--         exports.vCore:iprint(...);
--     end);
-- end);