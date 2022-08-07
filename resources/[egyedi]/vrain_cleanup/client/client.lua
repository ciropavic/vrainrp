RegisterNetEvent("delallveh")
AddEventHandler("delallveh", function ()
    TriggerEvent('chat:addMessage', { template = '<div class="chat-message system"><i class="fas fa-cog"></i> <b><span style="color: #df7b00">RENDSZER</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;"></span></b><div style="margin-top: 5px; font-weight: 300;"><b>Az elhagyott járművek 10 perc múlva törlésre kerülnek.</b></div></div>', args = {}})
    Wait(300000)         
    TriggerEvent('chat:addMessage', { template = '<div class="chat-message system"><i class="fas fa-cog"></i> <b><span style="color: #df7b00">RENDSZER</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;"></span></b><div style="margin-top: 5px; font-weight: 300;"><b>Az elhagyott járművek 5 perc múlva törlésre kerülnek.</b></div></div>', args = {}})
    Wait(240000)
    TriggerEvent('chat:addMessage', { template = '<div class="chat-message system"><i class="fas fa-cog"></i> <b><span style="color: #df7b00">RENDSZER</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;"></span></b><div style="margin-top: 5px; font-weight: 300;"><b>Az elhagyott járművek 1 perc múlva törlésre kerülnek.</b></div></div>', args = {}})
    Wait(60000)
    for vehicle in EnumerateVehicles() do
        if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then 
            SetVehicleHasBeenOwnedByPlayer(vehicle, false) 
            SetEntityAsMissionEntity(vehicle, false, false) 
            DeleteVehicle(vehicle)
            if (DoesEntityExist(vehicle)) then 
                DeleteVehicle(vehicle) 
            end
        end
    end
    TriggerEvent('chat:addMessage', { template = '<div class="chat-message system"><i class="fas fa-cog"></i> <b><span style="color: #df7b00">RENDSZER</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;"></span></b><div style="margin-top: 5px; font-weight: 300;"><b>Az elhagyott járművek törlésre kerültek.</b></div></div>', args = {}})
end)