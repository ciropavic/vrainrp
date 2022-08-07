-- exports.vCore:addFetch("valamimenocucc", function(callback, ...)
--     callback(false);
-- end);

Citizen.CreateThread(function()
    Wait(2000);
    local result = exports.vCore:useFetch("fetchTest::doTest");
    print("VALASZ", result);
end);