local backfire = false
local allowedVeh = {
    [GetHashKey("a80")] =       {backfireWait = {30, 150}, rpmFlame = 0.95, rpmFlameDecel = 0.80, backfire = true},
    [GetHashKey("gtr")] =       {backfireWait = {30, 150}, rpmFlame = 0.95, rpmFlameDecel = 0.80, backfire = true},
    [GetHashKey("Skyline")] =   {backfireWait = {30, 150}, rpmFlame = 0.95, rpmFlameDecel = 0.80, backfire = true},
    [GetHashKey("s15")] =       {backfireWait = {30, 150}, rpmFlame = 0.97, rpmFlameDecel = 0.90, backfire = false},
    [GetHashKey("fd")] =        {backfireWait = {100, 350}, rpmFlame = 0.97, rpmFlameDecel = 0.80, backfire = true},
    [GetHashKey("cz4a")] =        {backfireWait = {100, 350}, rpmFlame = 0.97, rpmFlameDecel = 0.80, backfire = true},
}

local p_flame_location = {
    "exhaust",
    "exhaust_1",
    "exhaust_2",
    "exhaust_3",
    "exhaust_4",
    "exhaust_5",
    "exhaust_6",
    "exhaust_7",
    "exhaust_8",
    "exhaust_9",
    "exhaust_10",
    "exhaust_11",
    "exhaust_12",
    "exhaust_13",
    "exhaust_14",
    "exhaust_15",
    "exhaust_16",
    "exhaust_17",
    "exhaust_18",
    "exhaust_19",
    "exhaust_20",
    "exhaust_21",
    "exhaust_22",
}
local p_flame_particle = "veh_backfire"
local p_flame_particle_asset = "core" 
local p_flame_size = 2.4

function randomFloat(lower, greater)
    return lower + math.random()  * (greater - lower);
end

function BackFire(veh, rpm)
    local parts = {}
	for _,bones in pairs(p_flame_location) do
		UseParticleFxAssetNextCall(p_flame_particle_asset)
        local bone = GetEntityBoneIndexByName(veh, bones)
        if bone ~= -1 then
		    local createdPart = StartParticleFxLoopedOnEntityBone(p_flame_particle, veh, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, bone, randomFloat(0.01, 1.3), 0.0, 0.0, 0.0)
            table.insert(parts, createdPart)
        end
		
	end

    Citizen.CreateThread(function()
        Wait(100)
        for k,v in pairs(parts) do
            StopParticleFxLooped(v, 1)
            RemoveParticleFx(v, 1)
        end
    end)

end

local cooldown = false
function ExplosionBackFire(veh, model)
    Citizen.CreateThread(function()
        if not cooldown then

            local parts = {}
            for _,bones in pairs(p_flame_location) do
                UseParticleFxAssetNextCall(p_flame_particle_asset)
                local bone = GetEntityBoneIndexByName(veh, bones)
                if bone ~= -1 then
                    local createdPart = StartParticleFxLoopedOnEntityBone(p_flame_particle, veh, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, bone, randomFloat(1.3, 2.6), 0.0, 0.0, 0.0)
                    table.insert(parts, createdPart)
                end
                
            end
        
            Citizen.CreateThread(function()
                Wait(350)
                for k,v in pairs(parts) do
                    StopParticleFxLooped(v, 1)
                    RemoveParticleFx(v, 1)
                end
            end)

            AddExplosion(GetEntityCoords(veh), 61, 0.0, true, true, 0.0, true)
            cooldown = true
            Wait(math.random(allowedVeh[GetEntityModel(veh)].backfireWait[1],allowedVeh[GetEntityModel(veh)].backfireWait[2]))
            cooldown = false
        end
    end)
    
end

Citizen.CreateThread(function()
    while true do
        local pPed = PlayerPedId()
        
        if IsPedInAnyVehicle(pPed, false) then

            local pVeh = GetVehiclePedIsIn(pPed, false)
            if allowedVeh[GetEntityModel(pVeh)] ~= nil then
                local rpm = GetVehicleCurrentRpm(pVeh)

                if IsControlPressed(0, 71) then
                    if rpm >= allowedVeh[GetEntityModel(pVeh)].rpmFlame then
                        BackFire(pVeh, rpm)
                    end
                else
                    if rpm >= allowedVeh[GetEntityModel(pVeh)].rpmFlameDecel then
                        BackFire(pVeh, rpm)
                    end

                    if pPed == GetPedInVehicleSeat(pVeh, -1) and backfire then
                        if rpm >= 0.90 and allowedVeh[GetEntityModel(pVeh)].backfire then
                            ExplosionBackFire(pVeh, GetEntityModel(pVeh))
                        end
                    end
                end

                Wait(1)
            else
                Wait(500)
            end
        else
            Wait(1000)
        end
    end
end)


RegisterCommand("backfire", function(source, args, rawCommand)
    TriggerServerEvent("backfire")
end, false)

RegisterNetEvent('backfire')
AddEventHandler('backfire', function()
    backfire = not backfire
    print(backfire)
end)