



function sendToDiscord(name, message)
    if message == nil or message == '' then return FALSE end
    PerformHttpRequest('https://discord.com/api/webhooks/964578988615946252/_1oBpDm9PL-YzNPk3ACrpJfEJxO47bw2dLQ3a5-mHXJ5hEh5WPuRsqiz5BOssaQrocF-', function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
end


RegisterCommand("achat", function(source, args, rawCommand)
	    local source = source
		local args = table.concat(args, " ")
		local name = GetPlayerName(source)
		for _, playerId in ipairs(GetPlayers()) do
			if IsPlayerAceAllowed(source, "command.heal") then
				if IsPlayerAceAllowed(playerId, "command.heal") then
				TriggerClientEvent('chat:addMessage', playerId, {
					template = '<div class="chat-message staffonly"><i class="fas fa-eye-slash"></i> <b><span style="color: #1ebc62">[ADMIN CHAT] {0}</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;"></span></b><div style="margin-top: 5px; font-weight: 300;">{1}</div></div>',
					args = { name, args }
				})
				sendToDiscord("(ADMIN) " .. name, args)
				end
			end
		end
end)