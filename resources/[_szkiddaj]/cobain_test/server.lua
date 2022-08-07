-- PerformHttpRequest(
--     "https://example.com", 
--     function(...)
--     end, 
--     "GET", 
--     json.encode({ }), 
--     {
--         ["Content-Type"] = "application/json"
--     }
-- )

RegisterNetEvent("mukogy")
AddEventHandler("mukogy", function(...)
    local _player = source;
    print("TriggerServerEvent klienstol", _player, ...)
end);