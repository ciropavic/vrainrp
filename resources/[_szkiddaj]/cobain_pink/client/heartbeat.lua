Citizen.CreateThread(function()
    while (true) do 
        local secret = SharedConfig.heartbeat.generate();
        TriggerServerEvent(SharedConfig.heartbeat.generate());
        Wait(5000);
    end 
end);