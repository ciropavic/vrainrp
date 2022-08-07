ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local DISCORD_WEBHOOK = "https://discord.com/api/webhooks/titkosmikkentyu"
local DISCORD_IMAGE = "https://cdn.discordapp.com/attachments/821811915189256204/958069789086089216/443263_1.png"
local DISCORD_NAME = "Közmunka Cheat (Valószínűleg)"
ESX.RegisterCommand('kozmunka', 'adminseged', function(xPlayer, args, showError)
	if args.id ~= nil and args.amount ~= nil then
		TriggerEvent('vrain_kozmunka:sendToKozmunka', args.id.source, args.amount, xPlayer.source)
		exports['vrain_logs']:createLog({
			EmbedMessage = 'ADMIN **ID: '..xPlayer.source..' '..GetPlayerName(xPlayer.source)..'** közmunkára ítélte **ID '..args.id.source..' '..GetPlayerName(args.id.source)..'** játékost, **'..args.amount..' darab** időre!',
			color = '#AB860C',
			channel = 'Kozmunka',
			screenshot = false -- Set this to true if you want to screenshot the players screen
		})
	else
		TriggerEvent('chat:addMessage', xPlayer.source {
			template = '<div class="chat-message system"><i class="fas fa-cog"></i> <b><span style="color: #df7b00">KÖZMUNKA</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">{0}</span></b><div style="margin-top: 5px; font-weight: 300;"><b>{1}</b></div></div>',
			args = { _U('system_msn'), _U('invalid_player_id_or_actions') }
		})
	end
end, true, {help = "Közmunkára tétel.", validate = true, arguments = {
	{name = "id", help = _U('target_id'), type = 'player'},
	{name = 'amount', help = "mennyiség", type = 'number'}
}})

ESX.RegisterCommand('kozmunkavege', 'adminseged', function(xPlayer, args, showError)
	if args.id ~= nil then
		TriggerEvent('vrain_kozmunka:endKozmunkaParancs', args.id.source)
		exports['vrain_logs']:createLog({
			EmbedMessage = 'ADMIN **ID: '..xPlayer.source..' '..GetPlayerName(xPlayer.source)..'** **ID '..args.id.source..' '..GetPlayerName(args.id.source)..'** játékost kivette a közmunkáról!',
			color = '#AB860C',
			channel = 'Kozmunka',
			screenshot = false -- Set this to true if you want to screenshot the players screen
		})
	else
		TriggerEvent('vrain_kozmunka:endKozmunkaParancs', xPlayer.source)
	end
end, true, {help = "Közmunka törlése.", validate = false, arguments = {
	{name = "id", help = _U('target_id'), type = 'player'}
}})




RegisterServerEvent('vrain_kozmunka:endKozmunkaParancs')
AddEventHandler('vrain_kozmunka:endKozmunkaParancs', function(source)
	if source ~= nil then
		releaseFromCommunityService(source)
	end
end)

-- unjail after time served
RegisterServerEvent('vrain_kozmunka:finishKozmunka')
AddEventHandler('vrain_kozmunka:finishKozmunka', function()
	local vegzett = MySQL.Sync.fetchAll("SELECT * FROM communityservice WHERE identifier = @identifier", {['@identifier'] = GetPlayerIdentifiers(source)[1]})
	if vegzett[1]["actions_remaining"] == 0 or IsPlayerAceAllowed(source, "command.fix") then
		releaseFromCommunityService(source)
		exports['vrain_logs']:createLog({
			EmbedMessage = '**ID: '..source..' '..GetPlayerName(source)..'** játékos befejezte a közmunkáját!',
			color = '#AB860C',
			channel = 'Kozmunka',
			screenshot = false -- Set this to true if you want to screenshot the players screen
		})
	else
		local user = {}
		for k,v in pairs(GetPlayerIdentifiers(source)) do             
			if string.sub(v, 1, string.len("steam:")) == "steam:" then -- Steam Hex
				user.steamhex = string.sub(v, 7)
			elseif string.sub(v, 1, string.len("license:")) == "license:" then -- Rockstar License
				user.license = string.sub(v, 9)
			elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then -- Xbox
				user.xbox = string.sub(v, 5)
			elseif string.sub(v, 1, string.len("ip:")) == "ip:" then -- Ip
				user.ip = string.sub(v, 4)
			elseif string.sub(v, 1, string.len("discord:")) == "discord:" then -- Discord ID
				user.discord = string.sub(v, 9)
			elseif string.sub(v, 1, string.len("live:")) == "live:" then -- Microsoft
				user.microsoft = string.sub(v, 6)
			end
		end
		local connect = {
		   {
			  ["color"] = 13112340,
			  ["title"] = "",
			  ["footer"] = {
				  ["text"] = os.date("%Y. %m. %d - %H:%M:%S"),
			  },
			  ["fields"] = {
				{
					["name"] = "Játékos",
					["value"] = "["..source.."] ".. GetPlayerName(source),
					["inline"] = false,
				},
				{
					["name"] = "​",
					["value"] = "​",
					["inline"] = false,
				},
				{
					["name"] = "Licensz",
					["value"] = user.license,
					["inline"] = false,
				},
				{
					["name"] = "SteamHEX",
					["value"] = "steam:"..user.steamhex,
					["inline"] = false,
				},
				{
					["name"] = "Discord",
					["value"] = "<@"..user.discord..">",
					["inline"] = false,
				},
			},
		  },
		}
		PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, embeds = connect, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
	end
end)





RegisterServerEvent('vrain_kozmunka:completeServiz')
AddEventHandler('vrain_kozmunka:completeServiz', function()

	local _source = source
	local identifier = GetPlayerIdentifiers(_source)[1]

	MySQL.Async.fetchAll('SELECT * FROM communityservice WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(result)

		if result[1] then
			MySQL.Async.execute('UPDATE communityservice SET actions_remaining = actions_remaining - 1 WHERE identifier = @identifier', {
				['@identifier'] = identifier
			})
		else
			print ("ESX_CommunityService :: Problem matching player identifier in database to reduce actions.")
		end
	end)
end)




RegisterServerEvent('vrain_kozmunka:Hosszabitas')
AddEventHandler('vrain_kozmunka:Hosszabitas', function()

	local _source = source
	local identifier = GetPlayerIdentifiers(_source)[1]

	MySQL.Async.fetchAll('SELECT * FROM communityservice WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(result)

		if result[1] then
			MySQL.Async.execute('UPDATE communityservice SET actions_remaining = actions_remaining + @extension_value WHERE identifier = @identifier', {
				['@identifier'] = identifier,
				['@extension_value'] = Config.ServiceExtensionOnEscape
			})
		else
			print ("ESX_CommunityService :: Problem matching player identifier in database to reduce actions.")
		end
	end)
end)

RegisterServerEvent('vrain_kozmunka:sendToKozmunka')
AddEventHandler('vrain_kozmunka:sendToKozmunka', function(target, actions_count, admin)
	local xPlayer = ESX.GetPlayerFromId(admin)
	local job = xPlayer.job.name
	local group = xPlayer.getGroup()

	if IsPlayerAceAllowed(admin, "command.fix") or job == "police" then
		local identifier = GetPlayerIdentifiers(target)[1]

		MySQL.Async.fetchAll('SELECT * FROM communityservice WHERE identifier = @identifier', {
			['@identifier'] = identifier
		}, function(result)
			if result[1] then
				MySQL.Async.execute('UPDATE communityservice SET actions_remaining = @actions_remaining, adminname = @adminname, osszactions = @osszactions WHERE identifier = @identifier', {
					['@identifier'] = identifier,
					['@actions_remaining'] = actions_count,
					['@adminname'] = GetPlayerName(admin),
					['@osszactions'] = actions_count
				})
			else
				MySQL.Async.execute('INSERT INTO communityservice (identifier, actions_remaining, adminname, osszactions) VALUES (@identifier, @actions_remaining, @adminname, @osszactions)', {
					['@identifier'] = identifier,
					['@actions_remaining'] = actions_count,
					['@adminname'] = GetPlayerName(admin),
					['@osszactions'] = actions_count
				})
			end
		end)

		TriggerClientEvent('vrain_notify:showNotification', -1,  _U('comserv_msg', GetPlayerName(target), actions_count, GetPlayerName(admin)), 'warn', 5400)
		TriggerClientEvent('esx_policejob:unrestrain', target)
		TriggerClientEvent('vrain_kozmunka:inKozmunka', target, actions_count)
	end
end)

RegisterCommand('kozmunkainfo', function(source, args, rawCommand)
	if IsPlayerAceAllowed(source, "command.fix") then
		if args[1] then
			local identifier = GetPlayerIdentifiers(args[1])[1]
			MySQL.Async.fetchAll('SELECT * FROM communityservice WHERE identifier = @identifier', {
				['@identifier'] = identifier
			}, function(result)
				if result[1] then
					local osszkozmunka = result[1]["osszactions"]
					local hatralevo = result[1]["actions_remaining"]
					local adminname = result[1]["adminname"]
					TriggerClientEvent('chat:addMessage', source, {
						template = '<div class="chat-message system"><i class="fas fa-cog"></i> <b><span style="color: #df7b00">KÖZMUNKA</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;"></span></b><div style="margin-top: 5px; font-weight: 300;"><b>Játékos: {0} | Admin: {1} | Összesen: {2} | Hátralévő: {3}</b></div></div>',
						args = { GetPlayerName(args[1]), adminname, osszkozmunka, hatralevo }
					})
				else
					TriggerClientEvent('chat:addMessage', source, {
						template = '<div class="chat-message system"><i class="fas fa-cog"></i> <b><span style="color: #df7b00">KÖZMUNKA</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;"></span></b><div style="margin-top: 5px; font-weight: 300;"><b>Játékos: {0} nincsen közmunkán.</b></div></div>',
						args = { GetPlayerName(args[1])}
					})
				end
			end)
		else
			TriggerClientEvent('chat:addMessage', source, {
				template = '<div class="chat-message system"><i class="fas fa-cog"></i> <b><span style="color: #df7b00">KÖZMUNKA</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;"></span></b><div style="margin-top: 5px; font-weight: 300;"><b>Add meg az ID-t!</b></div></div>',
				args = { GetPlayerName(args[1])}
			})
		end
	end
end)



RegisterServerEvent('vrain_kozmunka:checkIfBuntetett')
AddEventHandler('vrain_kozmunka:checkIfBuntetett', function()
	local _source = source -- cannot parse source to client trigger for some weird reason
	local identifier = GetPlayerIdentifiers(_source)[1] -- get steam identifier

	MySQL.Async.fetchAll('SELECT * FROM communityservice WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		if result[1] ~= nil and result[1].actions_remaining > 0 then
			--TriggerClientEvent('chat:addMessage', -1, { args = { _U('judge'), _U('jailed_msg', GetPlayerName(_source), ESX.Math.Round(result[1].jail_time / 60)) }, color = { 147, 196, 109 } })
			TriggerClientEvent('vrain_kozmunka:inKozmunka', _source, tonumber(result[1].actions_remaining))
		end
	end)
end)







function releaseFromCommunityService(target)

	local identifier = GetPlayerIdentifiers(target)[1]
	MySQL.Async.fetchAll('SELECT * FROM communityservice WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		if result[1] then
			MySQL.Async.execute('DELETE from communityservice WHERE identifier = @identifier', {
				['@identifier'] = identifier
			})

			TriggerClientEvent('vrain_notify:showNotification', -1, _U('comserv_finished', GetPlayerName(target)), 'warn', 5400)
		end
	end)

	TriggerClientEvent('vrain_kozmunka:finishKozmunka', target)
end
