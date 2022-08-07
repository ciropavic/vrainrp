local playersProcessingCannabis = {}
local outofbound = true
local alive = true

RegisterServerEvent('esx_drugs:sellDrug')
AddEventHandler('esx_drugs:sellDrug', function(itemName, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = Config.DrugDealerItems[itemName]
	local xItem = xPlayer.getInventoryItem(itemName)

	if not price then
		print(('esx_drugs: %s attempted to sell an invalid drug!'):format(xPlayer.identifier))
		return
	end

	if xItem.count < amount then
		xPlayer.showNotification(_U('dealer_notenough'))
		return
	end

	price = ESX.Math.Round(price * amount)

	if Config.GiveBlack then
		xPlayer.addAccountMoney('black_money', price)
	else
		xPlayer.addMoney(price)
	end

	xPlayer.removeInventoryItem(xItem.name, amount)
	xPlayer.showNotification(_U('dealer_sold', amount, xItem.label, ESX.Math.GroupDigits(price)))
end)

ESX.RegisterServerCallback('esx_drugs:buyLicense', function(source, cb, licenseName)
	local xPlayer = ESX.GetPlayerFromId(source)
	local license = Config.LicensePrices[licenseName]

	if license then
		if xPlayer.getMoney() >= license.price then
			xPlayer.removeMoney(license.price)

			TriggerEvent('esx_license:addLicense', source, licenseName, function()
				cb(true)
			end)
		else
			cb(false)
		end
	else
		print(('esx_drugs: %s attempted to buy an invalid license!'):format(xPlayer.identifier))
		cb(false)
	end
end)

RegisterServerEvent('esx_drugs:pickedUpCannabis')
AddEventHandler('esx_drugs:pickedUpCannabis', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.canCarryItem('cannabis', 1) then
		xPlayer.addInventoryItem('cannabis', 1)
	else
		xPlayer.showNotification(_U('weed_inventoryfull'))
	end
end)

ESX.RegisterServerCallback('esx_drugs:canPickUp', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	cb(xPlayer.canCarryItem(item, 1))
end)

RegisterServerEvent('esx_drugs:outofbound')
AddEventHandler('esx_drugs:outofbound', function()
	outofbound = true
end)

ESX.RegisterServerCallback('esx_drugs:cannabis_count', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xCannabis = xPlayer.getInventoryItem('cannabis').count
	cb(xCannabis)
end)

RegisterServerEvent('esx_drugs:processCannabis')
AddEventHandler('esx_drugs:processCannabis', function()
  if not playersProcessingCannabis[source] then
		local source = source
		local xPlayer = ESX.GetPlayerFromId(source)
		local xCannabis = xPlayer.getInventoryItem('cannabis')
		local can = true
		outofbound = false
    if xCannabis.count >= 3 then
      while outofbound == false and can do
				if playersProcessingCannabis[source] == nil then
					playersProcessingCannabis[source] = ESX.SetTimeout(Config.Delays.WeedProcessing , function()
            if xCannabis.count >= 3 then
              if xPlayer.canSwapItem('cannabis', 3, 'joint', 1) then
                xPlayer.removeInventoryItem('cannabis', 3)
                xPlayer.addInventoryItem('joint', 1)
								xPlayer.showNotification(_U('weed_processed'))
							else
								can = false
								xPlayer.showNotification(_U('weed_processingfull'))
								TriggerEvent('esx_drugs:cancelProcessing')
							end
						else						
							can = false
							xPlayer.showNotification(_U('weed_processingenough'))
							TriggerEvent('esx_drugs:cancelProcessing')
						end

						playersProcessingCannabis[source] = nil
					end)
				else
					Wait(Config.Delays.WeedProcessing)
				end	
			end
		else
			xPlayer.showNotification(_U('weed_processingenough'))
			TriggerEvent('esx_drugs:cancelProcessing')
		end	
			
	else
		print(('esx_drugs: %s attempted to exploit weed processing!'):format(GetPlayerIdentifiers(source)[1]))
	end
end)

function CancelProcessing(playerId)
	if playersProcessingCannabis[playerId] then
		ESX.ClearTimeout(playersProcessingCannabis[playerId])
		playersProcessingCannabis[playerId] = nil
	end
end

RegisterServerEvent('esx_drugs:cancelProcessing')
AddEventHandler('esx_drugs:cancelProcessing', function()
	CancelProcessing(source)
end)

AddEventHandler('esx:playerDropped', function(playerId, reason)
	CancelProcessing(playerId)
end)

RegisterServerEvent('esx:onPlayerDeath')
AddEventHandler('esx:onPlayerDeath', function(data)
	CancelProcessing(source)
end)

ESX.RegisterUsableItem('joint', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('joint', 1)
	TriggerClientEvent('vrain_drugs:armour', source)
end)

ESX.RegisterUsableItem('cigarette', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('cigarette', 1)
	TriggerClientEvent('vrain_drugs:smoke', source)
end)

ESX.RegisterUsableItem('lsd', function(source)
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeInventoryItem('lsd', 1)
	TriggerClientEvent('kypo-drug-effect:onLsd', source)
end)

ESX.RegisterUsableItem('metamfetamin', function(source)    
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeInventoryItem('metamfetamin', 1)
	TriggerClientEvent('kypo-drug-effect:onMeth', source)
end)