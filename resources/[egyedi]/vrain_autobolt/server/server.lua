--------------------------------------------------------------------
-------------------------Converted by Eotix#1337--------------------
--------------------------------------------------------------------
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('eotix-vehicleshop:requestInfo')
AddEventHandler('eotix-vehicleshop:requestInfo', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local rows    

    TriggerClientEvent('eotix-vehicleshop:receiveInfo', src, xPlayer.getMoney())
    TriggerClientEvent("eotix-vehicleshop:notify", src, 'error', 'Használd az [A] és [D] betűket, hogy mozgasd az autót')
end)

ESX.RegisterServerCallback('eotix-vehicleshop:isPlateTaken', function (source, cb, plate)
	MySQL.Async.fetchAll('SELECT 1 FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function (result)
		cb(result[1] ~= nil)
	end)
end)