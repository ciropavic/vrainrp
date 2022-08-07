local GetPlayerIdentifiers;

IS_DEBUG_ENABLED = true;

Sudoers = {
    -- ['steam:asd'] = true, 
};

function isPlayerInSudoers(player)
    return (type(player) == 'number' and Sudoers[((GetPlayerIdentifiers(player) or {}).steam or "")]);
end 

exports("isPlayerInSudoers", isPlayerInSudoers);

Citizen.CreateThread(function()
    Wait(3000);
    -- createVehicle("infernus", 0.0, 4.0, 75.0, 0.0, true, false);

    -- local object    = createObject("prop_weed_01", 0.0, 0.0, 85.0, true, true, false);
    
    -- local ped       = createPed(4, 0x9fd4292d, 0.0, 0.0, 78.0, 0.0, false, true);

    -- ped.freeze(true);

    -- ped.on("onMetaChange", function(entity, key, old, new) 
    --     print('valtozott ' .. key .. ', visszatartas mert miert ne', "| ezvolt: " .. tostring(old), "| ezlenne: " .. tostring(new)); 
    -- end);

    -- SetTimeout(8000, function()
    --     ped.setSharedMeta("someValamiMetaData", true);
    --     ped.freeze(false);
    --     SetTimeout(1000, function() print("someValamiMetaData erteke visszatartas utan", ped.getMeta("someValamiMetaData")); end);
    -- end);

    -- local marker = createMarker(0.0, 0.0, 73.0, "sawblade", 1.0, 255, 50, 50, 150, true, true);
    
    -- while (true) do
    --     local coords = GetEntityCoords(GetPlayerPed(1));

    --     marker.setPosition(coords.x, coords.y, coords.z); 
    --     marker.setColor(math.random(0, 255), math.random(0, 255), math.random(0, 255), math.random(50, 255));
    --     marker.setSize(math.random(4, 30) * 0.1);

    --     Wait(2000);
    -- end 

    -- local shape = createColCuboid(0.0, 0.0, 78.0, 10.0, 10.0, 10.0);
    -- print(shape.isPointWithin(2.0, 2.0, 2.0));

    -- local polygon = createColPolygon({ 
    --     vector3(-50.940658569336, -957.982421875, 29.0),
    --     vector3(-76.589012145996, -1028.0439453125, 28),
    --     vector3(-106.27252960206, -1109.1560058594, 25.5),
    --     vector3(-120.14505004882, -1123.8461914062, 25.5),
    --     vector3(-133.22637939454, -1128.8967285156, 25.5),
    --     vector3(-199.19999694824, -1129.5164794922, 22.0),
    --     vector3(-256.0615234375, -1129.3846435546, 23.25),
    --     vector3(-254.91429138184, -1117.806640625, 23.5), 
    --     vector3(-222.89669799804, -1029.0725097656, 28.75),
    --     vector3(-179.20878601074, -910.10107421875, 29.0)
    -- });

    -- polygon.on("onEntityEnter", function(self, entity)
    --     exports.vChat:outputChatBox(entity.__netId, "Bemente", "success", "success");
    -- end);

    -- polygon.on("onEntityLeave", function(self, entity)
    --     exports.vChat:outputChatBox(entity.__netId, "Kimente", "success", "success");
    -- end);

end);