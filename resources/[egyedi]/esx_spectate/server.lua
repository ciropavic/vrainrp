function getPlayerList()
	local players = {}
	for _, serverId in pairs(GetPlayers()) do
		local xPlayer = ESX.GetPlayerFromId(serverId)
		if xPlayer then
			local job = xPlayer.getJob()
			local jobText = job.label .. " - " .. job.grade_label

			table.insert(players, {
				serverId = serverId,
				name = xPlayer.getName() .. " (" .. GetPlayerName(serverId) .. ")",
				group = xPlayer.getGroup(),
				jobText = jobText,
			})
		end
	end

	return players
end

ESX.RegisterServerCallback("requestServerPlayers", function(source, cb)
	local xSource = ESX.GetPlayerFromId(source)
	if xSource and IsPlayerAceAllowed(source, "command.fix") then
		cb(getPlayerList())
	else
		return cb(false)
	end
end)

ESX.RegisterServerCallback("requestPlayerCoords", function(source, cb, serverId)
	local xSource = ESX.GetPlayerFromId(source)
	local targetPed = GetPlayerPed(serverId)
	if xSource and targetPed >= 0 and IsPlayerAceAllowed(source, "command.fix") then
		cb(GetEntityCoords(targetPed))
	else
		return cb(false)
	end
end)

ESX.RegisterServerCallback("kickPlayerSpectate", function(source, cb, target)
	local xSource = ESX.GetPlayerFromId(source)
	if xSource and IsPlayerAceAllowed(source, "command.fix") then
		DropPlayer(target, "Ki lettél rúgva a szerverről. ~ Általa: " .. GetPlayerName(source))
		cb(getPlayerList())
	else
		return
	end
end)

RegisterCommand("spectate", function(player, args, cmd)
	local xPlayer = ESX.GetPlayerFromId(player)
	if xPlayer and IsPlayerAceAllowed(player, "command.fix") then
		TriggerClientEvent("openSpectateMenu", player, getPlayerList())
	else
		return
	end
end)
