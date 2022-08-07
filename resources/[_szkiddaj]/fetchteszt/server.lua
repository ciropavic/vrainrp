-- Citizen.CreateThread(function()
--     Wait(5000);
--     exports.vCore:useFetchAsync(
--         3, "valamimenocucc", 
--         function(...)
            
--         end,
--         "owo", "miez"
--     );
-- end);

exports.vCore:addFetch(
    "fetchTest::doTest", 
    function(player, callback)
        return callback("911 was a CIA mission 8)");
    end
);