ESX = nil

local playersActions = { };

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('es:addGroupCommand', 'comserv', 'admin', function(source, args, user)
	if args[1] and GetPlayerName(args[1]) ~= nil and tonumber(args[2]) then
		TriggerEvent('esx_communityservice:sendToCommunityService', source, tonumber(args[1]), tonumber(args[2]))
	else
		TriggerClientEvent('chat:addMessage', source, { args = { _U('system_msn'), _U('invalid_player_id_or_actions') } } )
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { _U('system_msn'), _U('insufficient_permissions') } })
end, {help = _U('give_player_community'), params = {{name = "id", help = _U('target_id')}, {name = "actions", help = _U('action_count_suggested')}}})
_U('system_msn')

TriggerEvent('es:addGroupCommand', 'endcomserv', 'admin', function(source, args, user)
	if args[1] then
		if GetPlayerName(args[1]) ~= nil then
			TriggerEvent('esx_communityservice:endCommunityServiceCommand', tonumber(args[1]))
		else
			TriggerClientEvent('chat:addMessage', source, { args = { _U('system_msn'), _U('invalid_player_id')  } } )
		end
	else
		TriggerEvent('esx_communityservice:endCommunityServiceCommand', source)
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { _U('system_msn'), _U('insufficient_permissions') } })
end, {help = _U('unjail_people'), params = {{name = "id", help = _U('target_id')}}})

AddEventHandler('esx_communityservice:endCommunityServiceCommand', function(source)
	if (source ~= nil) then
		releaseFromCommunityService(source);

		local identifier = GetPlayerIdentifiers(source)[1];
		if (identifier and playersActions[identifier]) then 
			playersActions[identifier] = nil;
		end 
	end
end)

local actionsFlood = { };
RegisterNetEvent('esx_communityservice:doComservAction');
AddEventHandler('esx_communityservice:doComservAction', function()
	if (actionsFlood[source] and actionsFlood[source] + 3 > os.time()) then
		TriggerEvent('jdlogs:sendWebhookMessage', player, 'talan modmenus/executoros a srac, mivel tul gyorsan vegzi el a kozmunka feladatokat.', 'anticheat');
		return;
	end 

	actionsFlood[source] = os.time();

	local identifier = GetPlayerIdentifiers(source)[1];
	if (identifier and playersActions[identifier]) then 
		if (playersActions[identifier] <= 1) then 
			TriggerEvent('esx_communityservice:endCommunityServiceCommand', source);
		else 
			playersActions[identifier] = playersActions[identifier] - 1;
			TriggerClientEvent('esx_communityservice:updateCount', source, playersActions[identifier]);
		end 
	end 
end);

RegisterServerEvent('esx_communityservice:completeService')
AddEventHandler('esx_communityservice:completeService', function()
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

RegisterServerEvent('esx_communityservice:extendService')
AddEventHandler('esx_communityservice:extendService', function()

	local _source = source
	local identifier = GetPlayerIdentifiers(_source)[1]

	playersActions[identifier] = playersActions[identifier] + Config.ServiceExtensionOnEscape;

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

local allowedGroups = {
	developer = true,
	superadmin = true,
	admin = true, 
	mod = true,
};

RegisterServerEvent('esx_communityservice:sendToCommunityService')
AddEventHandler('esx_communityservice:sendToCommunityService', function(player, target, actions_count)
	TriggerEvent("es:getPlayerFromId", player, function(user)
		if (user and allowedGroups[user.getGroup()]) then 
			local identifier = GetPlayerIdentifiers(target)[1];

			MySQL.Async.fetchAll('SELECT * FROM communityservice WHERE identifier = @identifier', {
				['@identifier'] = identifier
			}, function(result)
				if result[1] then
					MySQL.Async.execute('UPDATE communityservice SET actions_remaining = @actions_remaining WHERE identifier = @identifier', {
						['@identifier'] = identifier,
						['@actions_remaining'] = actions_count
					})
				else
					MySQL.Async.execute('INSERT INTO communityservice (identifier, actions_remaining) VALUES (@identifier, @actions_remaining)', {
						['@identifier'] = identifier,
						['@actions_remaining'] = actions_count
					})
				end
			end)

			playersActions[identifier] = actions_count;

			TriggerClientEvent('chat:addMessage', -1, { args = { _U('judge'), _U('comserv_msg', GetPlayerName(target), actions_count) }, color = { 147, 196, 109 } })
			TriggerClientEvent('esx_policejob:unrestrain', target)
			TriggerClientEvent('esx_communityservice:inCommunityService', target, actions_count)
			TriggerEvent('jdlogs:sendWebhookMessage', target, 'közmunkára került. ('..actions_count..' db)', 'commserv');
		else 
			TriggerEvent('jdlogs:sendWebhookMessage', player, 'Megpróbált embert berakni közmunkára rang nélkül! (Valszeg executoros nokedli) Automatikusan ki lett tiltva a szerverről!', 'anticheat');
			TriggerEvent('sBan:banPlayer', player, 'Pacsi, majdnem sikerult mindenkit berakni kozmunkara a free execeddel. <3', 'Rendszer', -1);
		end
	end);
end);

RegisterServerEvent('esx_communityservice:checkIfSentenced')
AddEventHandler('esx_communityservice:checkIfSentenced', function()
	local _source = source -- cannot parse source to client trigger for some weird reason
	local identifier = GetPlayerIdentifiers(_source)[1] -- get steam identifier

	MySQL.Async.fetchAll('SELECT * FROM communityservice WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		if result[1] ~= nil and result[1].actions_remaining > 0 then
			--TriggerClientEvent('chat:addMessage', -1, { args = { _U('judge'), _U('jailed_msg', GetPlayerName(_source), ESX.Math.Round(result[1].jail_time / 60)) }, color = { 147, 196, 109 } })
			TriggerClientEvent('esx_communityservice:inCommunityService', _source, tonumber(result[1].actions_remaining))

			local identifier = GetPlayerIdentifiers(_source)[1];
			if (identifier and not playersActions[identifier]) then 
				playersActions[identifier] = tonumber(result[1].actions_remaining);
			end 
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

			TriggerClientEvent('chat:addMessage', -1, { args = { _U('judge'), _U('comserv_finished', GetPlayerName(target)) }, color = { 147, 196, 109 } });
		end
	end)

	TriggerEvent('jdlogs:sendWebhookMessage', target, 'végzett a közmunkával.', 'commserv');
	TriggerClientEvent('esx_communityservice:finishCommunityService', target)
end
