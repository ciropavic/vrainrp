ESX = nil



TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterServerEvent('prx_dineronegro:lavarDinero')
AddEventHandler('prx_dineronegro:lavarDinero', function(amount, token) --token is for prevent Lua Executor to cheat a player
	if token ~= 'rTQ(@CwZjhU' then return end
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	local accountMoney = 0
	washedCash = amount / 2

	
	
	accountMoney = xPlayer.getAccount('black_money').money
	
		if amount > 0 and xPlayer.getAccount('black_money').money >= amount then

			TriggerClientEvent('vrain_moneywash:pbar', source)
			Wait(90000)

			xPlayer.removeAccountMoney('black_money', amount)
			xPlayer.addMoney(washedCash)
		--	notification('Has lavado: '..amount..'€ de dinero negro / You are wash: '..amount..'€ of black money')
			TriggerClientEvent('vrain_notify:showNotification', source, _U('are_wash1')..washedCash.._U('are_wash2'), 'success', 10000)
		else
			TriggerClientEvent('vrain_notify:showNotification', source, _U('dont_have_money'), 'error', 10000)
		end
end)




