ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local Webhook = ''

RegisterServerEvent('okokContract:changeVehicleOwner')
AddEventHandler('okokContract:changeVehicleOwner', function(data)
	_source = data.sourceIDSeller
	target = data.targetIDSeller
	plate = data.plateNumberSeller
	model = data.modelSeller
	source_name = data.sourceNameSeller
	target_name = data.targetNameSeller
	vehicle_price = tonumber(data.vehicle_price)

	local xPlayer = ESX.GetPlayerFromId(_source)
	local tPlayer = ESX.GetPlayerFromId(target)
	local webhookData = {
		model = model,
		plate = plate,
		target_name = target_name,
		source_name = source_name,
		vehicle_price = vehicle_price
	}
	local result = MySQL.Sync.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @identifier AND plate = @plate', {
		['@identifier'] = xPlayer.identifier,
		['@plate'] = plate
	})

	if Config.RemoveMoneyOnSign then
		local bankMoney = tPlayer.getAccount('bank').money

		if result[1] ~= nil  then
			if bankMoney >= vehicle_price then
				MySQL.Async.execute('UPDATE owned_vehicles SET owner = @target WHERE owner = @owner AND plate = @plate', {
					['@owner'] = xPlayer.identifier,
					['@target'] = tPlayer.identifier,
					['@plate'] = plate
				}, function (result2)
					if result2 ~= 0 then	
						tPlayer.removeAccountMoney('bank', vehicle_price)
						xPlayer.addAccountMoney('bank', vehicle_price)

						TriggerClientEvent('vrain_notify:showNotification', _source, 'Sikeresen eladtad a járműved: <b>'..model..'</b>, rendszáma: <b>'..plate..'</b>', 'success', 10000)
						TriggerClientEvent('vrain_notify:showNotification', target, 'Sikeresen vásároltál egy járművet: <b>'..model..'</b>, rendszáma: <b>'..plate..'</b>', 'success', 10000)

						if Webhook ~= '' then
							sellVehicleWebhook(webhookData)
						end
					end
				end)
			else
				TriggerClientEvent('vrain_notify:showNotification', _source, target_name..' nem rendelkezik elég pénzzel a bankban, hogy megvásárolja a járművet.', 'error', 10000)
				TriggerClientEvent('vrain_notify:showNotification', target, 'Nem rendelkezel elég pénzzel a bankban, hogy megvásárold '..source_name..' járművét.', 'error', 10000)
			end
		else
			TriggerClientEvent('vrain_notify:showNotification', _source, 'A jármű, amit elszeretnél adni, nem a te tulajdonodban van. Rendszám: <b>'..plate..'</b>', 'error', 10000)
			TriggerClientEvent('vrain_notify:showNotification', target, source_name..' megpróbált eladni egy járművet, ami nem az ő tulajdonában áll.', 'error', 10000)

		end
	else
		if result[1] ~= nil then
			MySQL.Async.execute('UPDATE owned_vehicles SET owner = @target WHERE owner = @owner AND plate = @plate', {
				['@owner'] = xPlayer.identifier,
				['@target'] = tPlayer.identifier,
				['@plate'] = plate
			}, function (result2)
				if result2 ~= 0 then
					TriggerClientEvent('vrain_notify:showNotification', _source, 'Sikeresen eladtál egy járművet: <b>'..model..'</b>, rendszám: <b>'..plate..'</b>', 'success', 10000)
					TriggerClientEvent('vrain_notify:showNotification', target, 'Sikeresen vásároltál egy járművet: <b>'..model..'</b>, rendszám: <b>'..plate..'</b>', 'success', 10000)


					if Webhook ~= '' then
						sellVehicleWebhook(webhookData)
					end
				end
			end)
		else
			TriggerClientEvent('vrain_notify:showNotification', _source, 'A jármű, amit elszeretnél adni, nem a te tulajdonodban van. Rendszám: <b>'..plate..'</b>', 'error', 10000)
			TriggerClientEvent('vrain_notify:showNotification', target, source_name..' megpróbált eladni egy járművet, ami nem az ő tulajdonában áll.', 'error', 10000)
		end
	end
end)

ESX.RegisterServerCallback('okokContract:GetTargetName', function(source, cb, targetid)
	local target = ESX.GetPlayerFromId(targetid)
	local targetname = target.getName()

	cb(targetname)
end)

RegisterServerEvent('okokContract:SendVehicleInfo')
AddEventHandler('okokContract:SendVehicleInfo', function(description, price)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerClientEvent('okokContract:GetVehicleInfo', _source, xPlayer.getName(), os.date(Config.DateFormat), description, price, _source)
end)

RegisterServerEvent('okokContract:SendContractToBuyer')
AddEventHandler('okokContract:SendContractToBuyer', function(data)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerClientEvent("okokContract:OpenContractOnBuyer", data.targetID, data)
	TriggerClientEvent('okokContract:startContractAnimation', data.targetID)

	if Config.RemoveContractAfterUse then
		xPlayer.removeInventoryItem('contract', 1)
	end
end)

ESX.RegisterUsableItem('contract', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerClientEvent('okokContract:OpenContractInfo', _source)
	TriggerClientEvent('okokContract:startContractAnimation', _source)
end)

-------------------------- SELL VEHICLE WEBHOOK

function sellVehicleWebhook(data)
	local information = {
		{
			["color"] = Config.sellVehicleWebhookColor,
			["author"] = {
				["icon_url"] = Config.IconURL,
				["name"] = Config.ServerName..' - Logs',
			},
			["title"] = 'VEHICLE SALE',
			["description"] = '**Jármű: **'..data.model..'**\nRendszám: **'..data.plate..'**\nVásárló neve: **'..data.target_name..'**\nEladó neve: **'..data.source_name..'**\nÁr: **'..data.vehicle_price..'$',

			["footer"] = {
				["text"] = os.date(Config.WebhookDateFormat),
			}
		}
	}
	PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.BotName, embeds = information}), {['Content-Type'] = 'application/json'})
end