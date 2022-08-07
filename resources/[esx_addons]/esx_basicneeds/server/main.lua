-------------------------------------------
ESX.RegisterUsableItem('bread', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('bread', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	xPlayer.showNotification(_U('used_bread'))
	TriggerClientEvent('vrain_notify:showNotification', source, 'Ettél egy kenyeret!', 'info', 4000)
end)
-------------------------------------------
ESX.RegisterUsableItem('muffin', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('muffin', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('vrain_notify:showNotification', source, 'Ettél egy muffint!', 'info', 4000)
end)
-------------------------------------------
ESX.RegisterUsableItem('pizza', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('pizza', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('vrain_notify:showNotification', source, 'Ettél egy pizzát!', 'info', 4000)
end)
-------------------------------------------
ESX.RegisterUsableItem('hamburger', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('hamburger', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('vrain_notify:showNotification', source, 'Ettél egy hamburgert!', 'info', 4000)
end)
--------------------------------------------
-------------------------------------------
ESX.RegisterUsableItem('vattacukor', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('vattacukor', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('vrain_notify:showNotification', source, 'Ettél egy vattacukrot!', 'info', 4000)
end)
-------------------------------------------
ESX.RegisterUsableItem('hotdog', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('hotdog', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('vrain_notify:showNotification', source, 'Ettél egy hotdog-ot!', 'info', 4000)
end)
-------------------------------------------
ESX.RegisterUsableItem('nyaloka', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('nyaloka', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('vrain_notify:showNotification', source, 'Ettél egy nyalókát!', 'info', 4000)
end)
--------------------------------------------
ESX.RegisterUsableItem('water', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('water', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('vrain_notify:showNotification', source, 'Ittál egy vizet!', 'info', 4000)
end)
-------------------------------------------
ESX.RegisterUsableItem('cocacola', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('cocacola', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('vrain_notify:showNotification', source, 'Ittál egy kólát!', 'info', 4000)
end)
-------------------------------------------
ESX.RegisterUsableItem('sprite', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('sprite', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('vrain_notify:showNotification', source, 'Ittál egy Sprite-ot!', 'info', 4000)
end)
-------------------------------------------
ESX.RegisterUsableItem('fanta', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('fanta', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('vrain_notify:showNotification', source, 'Ittál egy Fantát!', 'info', 4000)
end)
-------------------------------------------
ESX.RegisterUsableItem('mountaindew', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('mountaindew', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('vrain_notify:showNotification', source, 'Ittál egy Mountain Dew-ot!', 'info', 4000)
end)
-------------------------------------------
ESX.RegisterUsableItem('tavaszitekercs', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('tavaszitekercs', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('vrain_notify:showNotification', source, 'Ettél egy tavaszi tekercset!', 'info', 4000)
end)
-------------------------------------------
ESX.RegisterUsableItem('sushi', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('sushi', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('vrain_notify:showNotification', source, 'Ettél egy sushi-t!', 'info', 4000)
end)
-------------------------------------------
ESX.RegisterUsableItem('szerencsesuti', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('szerencsesuti', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('vrain_notify:showNotification', source, 'Ettél egy szerencse sütit!', 'info', 4000)
end)
-------------------------------------------
ESX.RegisterUsableItem('tea', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('tea', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('vrain_notify:showNotification', source, 'Ittál egy teát!', 'info', 4000)
end)
-------------------------------------------
ESX.RegisterUsableItem('whiskey', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('whiskey', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('vrain_notify:showNotification', source, 'Ittál egy whiskey-t!', 'info', 4000)
end)
-------------------------------------------

AddEventHandler('txAdmin:events:healedPlayer', function(eventData)
	if GetInvokingResource() ~= "monitor" or type(eventData) ~= "table" or type(eventData.id) ~= "number" then
		return
	end

	TriggerClientEvent('esx_basicneeds:healPlayer', eventData.id)
end)