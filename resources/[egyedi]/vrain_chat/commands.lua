ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local canAdvertise = true

if Config.AllowPlayersToClearTheirChat then
	RegisterCommand(Config.ClearChatCommand, function(source, args, rawCommand)
		TriggerClientEvent('chat:client:ClearChat', source)
	end)
end

if Config.AllowStaffsToClearEveryonesChat then
	RegisterCommand(Config.ClearEveryonesChatCommand, function(source, args, rawCommand)
		local xPlayer = ESX.GetPlayerFromId(source)
		local time = os.date(Config.DateFormat)

		if IsPlayerAceAllowed(source, "command.fix") then
			TriggerClientEvent('chat:client:ClearChat', -1)
			TriggerClientEvent('chat:addMessage', -1, {
				template = '<div class="chat-message system"><i class="fas fa-cog"></i> <b><span style="color: #df7b00">SYSTEM</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">{0}</span></b><div style="margin-top: 5px; font-weight: 300;">A chat törölve lett.</div></div>',
				args = { time }
			})
		end
	end)
end

if Config.EnableStaffCommand then
	RegisterCommand(Config.StaffCommand, function(source, args, rawCommand)
		local xPlayer = ESX.GetPlayerFromId(source)
		local length = string.len(Config.StaffCommand)
		local message = rawCommand:sub(length + 1)
		local time = os.date(Config.DateFormat)
		playerName = xPlayer.getName()
		for i=0, GetNumPlayerIndices()-1 do
			if IsPlayerAceAllowed(GetPlayerFromIndex(i), "command.fix") then
				TriggerClientEvent('chat:addMessage', GetPlayerFromIndex(i), {
					template = '<div class="chat-message staff"><i class="fas fa-shield-alt"></i> <b><span style="color: #1ebc62">[STAFF] {0}</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">{2}</span></b><div style="margin-top: 5px; font-weight: 300;">{1}</div></div>',
					args = { playerName, message, time }
				})
			end
		end
	end)
end

if Config.EnableAdvertisementCommand then
	RegisterCommand(Config.AdvertisementCommand, function(source, args, rawCommand)
		local xPlayer = ESX.GetPlayerFromId(source)
		local length = string.len(Config.AdvertisementCommand)
		local message = rawCommand:sub(length + 1)
		local time = os.date(Config.DateFormat)
		playerName = xPlayer.getName()
		local bankMoney = xPlayer.getAccount('bank').money

		if canAdvertise then
			if bankMoney >= Config.AdvertisementPrice then
				xPlayer.removeAccountMoney('bank', Config.AdvertisementPrice)
				TriggerClientEvent('chat:addMessage', -1, {
					template = '<div class="chat-message advertisement"><i class="fas fa-ad"></i> <b><span style="color: #81db44">{0}</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">{2}</span></b><div style="margin-top: 5px; font-weight: 300;">{1}</div></div>',
					args = { playerName, message, time }
				})

				TriggerClientEvent('vrain_notify:showNotification', source, 'Sikeresen feladtál egy hirdetést.', 'success', 10000)

				local time = Config.AdvertisementCooldown * 60
				local pastTime = 0
				canAdvertise = false

				while (time > pastTime) do
					Citizen.Wait(1000)
					pastTime = pastTime + 1
					timeLeft = time - pastTime
				end
				canAdvertise = true
			else
				TriggerClientEvent('vrain_notify:showNotification', source, 'Nincsen elegendő pénzed a hirdetés feladásához!', 'error', 10000)
			end
		else
			TriggerClientEvent('vrain_notify:showNotification', source, 'Nem tudsz ilyen gyorsan hirdetést feladni újra!', 'error', 10000)
		end
	end)
end

if Config.EnableTwitchCommand then
	RegisterCommand(Config.TwitchCommand, function(source, args, rawCommand)
		local xPlayer = ESX.GetPlayerFromId(source)
		local length = string.len(Config.TwitchCommand)
		local message = rawCommand:sub(length + 1)
		local time = os.date(Config.DateFormat)
		playerName = xPlayer.getName()
		local twitch = twitchPermission(source)

		if twitch then
			TriggerClientEvent('chat:addMessage', -1, {
				template = '<div class="chat-message twitch"><i class="fab fa-twitch"></i> <b><span style="color: #9c70de">{0}</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">{2}</span></b><div style="margin-top: 5px; font-weight: 300;">{1}</div></div>',
				args = { playerName, message, time }
			})
		end
	end)
end

function twitchPermission(id)
	for i, a in ipairs(Config.TwitchList) do
		for x, b in ipairs(GetPlayerIdentifiers(id)) do
			if string.lower(b) == string.lower(a) then
				return true
			end
		end
	end
end

if Config.EnableYoutubeCommand then
	RegisterCommand(Config.YoutubeCommand, function(source, args, rawCommand)
		local xPlayer = ESX.GetPlayerFromId(source)
		local length = string.len(Config.YoutubeCommand)
		local message = rawCommand:sub(length + 1)
		local time = os.date(Config.DateFormat)
		playerName = xPlayer.getName()
		local youtube = youtubePermission(source)

		if youtube then
			TriggerClientEvent('chat:addMessage', -1, {
				template = '<div class="chat-message youtube"><i class="fab fa-youtube"></i> <b><span style="color: #ff0000">{0}</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">{2}</span></b><div style="margin-top: 5px; font-weight: 300;">{1}</div></div>',
				args = { playerName, message, time }
			})
		end
	end)
end

function youtubePermission(id)
	for i, a in ipairs(Config.YoutubeList) do
		for x, b in ipairs(GetPlayerIdentifiers(id)) do
			if string.lower(b) == string.lower(a) then
				return true
			end
		end
	end
end

if Config.EnableTwitterCommand then
	RegisterCommand(Config.TwitterCommand, function(source, args, rawCommand)
		local xPlayer = ESX.GetPlayerFromId(source)
		local length = string.len(Config.TwitterCommand)
		local message = rawCommand:sub(length + 1)
		local time = os.date(Config.DateFormat)
		playerName = xPlayer.getName()

		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div class="chat-message twitter"><i class="fab fa-twitter"></i> <b><span style="color: #2aa9e0">{0}</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">{2}</span></b><div style="margin-top: 5px; font-weight: 300;">{1}</div></div>',
			args = { playerName, message, time }
		})
	end)
end

RegisterCommand(Config.HtwtCommand, function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	local length = string.len(Config.HtwtCommand)
	local message = rawCommand:sub(length + 1)
	local time = os.date(Config.DateFormat)

	TriggerClientEvent('chat:addMessage', -1, {
		template = '<div class="chat-message htwt"><i class="fab fa-redhat"></i> <b><span style="color: #7a7a7a">{2}</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">{1}</span></b><div style="margin-top: 5px; font-weight: 300;">{0}</div></div>',
		args = { message, time, source }
	})
end)

RegisterCommand(Config.HtktCommand, function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	local length = string.len(Config.HtktCommand)
	local message = rawCommand:sub(length + 1)
	local time = os.date(Config.DateFormat)

	TriggerClientEvent('chat:addMessage', -1, {
		template = '<div class="chat-message htwt"><i class="fab fa-redhat"></i> <b><span style="color: #7a7a7a">{2}</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">{1}</span></b><div style="margin-top: 5px; font-weight: 300;">{0}</div></div>',
		args = { message, time, source }
	})
end)

RegisterCommand(Config.DarkwebCommand, function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	local length = string.len(Config.DarkwebCommand)
	local message = rawCommand:sub(length + 1)
	local time = os.date(Config.DateFormat)

	TriggerClientEvent('chat:addMessage', -1, {
		template = '<div class="chat-message htwt"><i class="fab fa-redhat"></i> <b><span style="color: #7a7a7a">{2}</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">{1}</span></b><div style="margin-top: 5px; font-weight: 300;">{0}</div></div>',
		args = { message, time, source }
	})
end)

if Config.EnablePoliceCommand then
	RegisterCommand(Config.PoliceCommand, function(source, args, rawCommand)
		local xPlayer = ESX.GetPlayerFromId(source)
		local length = string.len(Config.PoliceCommand)
		local message = rawCommand:sub(length + 1)
		local time = os.date(Config.DateFormat)
		playerName = xPlayer.getName()
		local job = xPlayer.job.name

		if job == Config.PoliceJobName then
			TriggerClientEvent('chat:addMessage', -1, {
				template = '<div class="chat-message police"><i class="fas fa-bullhorn"></i> <b><span style="color: #4a6cfd">Rendőrség</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">{1}</span></b><div style="margin-top: 5px; font-weight: 300;">{0}</div></div>',
				args = { message, time }
			})
		end
	end)
end

if Config.EnableDeltaForceCommand then
	RegisterCommand(Config.DeltaForceCommand, function(source, args, rawCommand)
		local xPlayer = ESX.GetPlayerFromId(source)
		local length = string.len(Config.DeltaForceCommand)
		local message = rawCommand:sub(length + 1)
		local time = os.date(Config.DateFormat)
		playerName = xPlayer.getName()
		local job = xPlayer.job.name

		if job == Config.DeltaForceJobName then
			TriggerClientEvent('chat:addMessage', -1, {
				template = '<div class="chat-message deltaforce"><i class="fas fa-helicopter"></i> <b><span style="color: #003100">Delta Force</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">{1}</span></b><div style="margin-top: 5px; font-weight: 300;">{0}</div></div>',
				args = { message, time }
			})
		end
	end)
end

RegisterCommand(Config.MechanicCommand, function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	local length = string.len(Config.MechanicCommand)
	local message = rawCommand:sub(length + 1)
	local time = os.date(Config.DateFormat)
	playerName = xPlayer.job.name
	local job = xPlayer.job.name
	

	if job == Config.MechanicJobName then
		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div class="chat-message mechanic"><i class="fas fa-wrench"></i> <b><span style="color: #d17803">Szerelőtelep</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">{1}</span></b><div style="margin-top: 5px; font-weight: 300;">{0}</div></div>',
			args = { message, time }
		})
	end
end)


if Config.EnableAmbulanceCommand then
	RegisterCommand(Config.AmbulanceCommand, function(source, args, rawCommand)
		local xPlayer = ESX.GetPlayerFromId(source)
		local length = string.len(Config.AmbulanceCommand)
		local message = rawCommand:sub(length + 1)
		local time = os.date(Config.DateFormat)
		playerName = xPlayer.getName()
		local job = xPlayer.job.name

		if job == Config.AmbulanceJobName then
			TriggerClientEvent('chat:addMessage', -1, {
				template = '<div class="chat-message ambulance"><i class="fas fa-ambulance"></i> <b><span style="color: #b62d2d">EMS</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">{1}</span></b><div style="margin-top: 5px; font-weight: 300;">{0}</div></div>',
				args = { message, time }
			})
		end
	end)
end

if Config.EnablePearlsCommand then
	RegisterCommand(Config.PearlsCommand, function(source, args, rawCommand)
		local xPlayer = ESX.GetPlayerFromId(source)
		local length = string.len(Config.PearlsCommand)
		local message = rawCommand:sub(length + 1)
		local time = os.date(Config.DateFormat)
		playerName = xPlayer.getName()
		local job = xPlayer.job.name

		if job == Config.PearlsJobName then
			TriggerClientEvent('chat:addMessage', -1, {
				template = '<div class="chat-message pearls"><i class="fas fa-wine-glass"></i> <b><span style="color: #e1e1e1">Pearls Restaurant</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">{1}</span></b><div style="margin-top: 5px; font-weight: 300;">{0}</div></div>',
				args = { message, time }
			})
		end
	end)
end

if Config.EnableOOCCommand then
	RegisterCommand(Config.OOCCommand, function(source, args, rawCommand)
		local xPlayer = ESX.GetPlayerFromId(source)
		local length = string.len(Config.OOCCommand)
		local message = rawCommand:sub(length + 1)
		local time = os.date(Config.DateFormat)
		playerName = xPlayer.getName()
		TriggerClientEvent('chat:ooc', -1, source, playerName, message, time)
	end)
end

function isAdmin(xPlayer)
	for k,v in ipairs(Config.StaffGroups) do
		if xPlayer.getGroup() == v then 
			return true 
		end
	end
	return false
end

function showOnlyForAdmins(admins)
	for k,v in ipairs(ESX.GetPlayers()) do
		if isAdmin(ESX.GetPlayerFromId(v)) then
			admins(v)
		end
	end
end
