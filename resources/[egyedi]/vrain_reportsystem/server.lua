local oneSync = false
ESX = nil

Citizen.CreateThread(function()
	if GetConvar("onesync") ~= 'off' then
		oneSync = true
	end
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end)
end)

-------------------------- VARS

local Webhook = 'https://discord.com/api/webhooks/952263950605647902/zxTfE5i95oFpaiHnxcz4ntya0a9xUGf7JM46HeWqtPP87-NT20dWsJlW5cxqAFYP6vsi'
local staffs = {}
local FeedbackTable = {}

-------------------------- NEW FEEDBACK

RegisterNetEvent("okokReports:NewFeedback")
AddEventHandler("okokReports:NewFeedback", function(data)
	local identifierlist = ExtractIdentifiers(source)
	local newFeedback = {
		feedbackid = #FeedbackTable+1,
		playerid = source,
		identifier = identifierlist.license:gsub("license2:", ""),
		subject = data.subject,
		information = data.information,
		category = data.category,
		concluded = false,
		discord = "<@"..identifierlist.discord:gsub("discord:", "")..">"
	}

	FeedbackTable[#FeedbackTable+1] = newFeedback

	for _, player in ipairs(GetPlayers()) do 
		player = tonumber(player);
		if (player and exports.vAdmin:getPlayerAdminLevel(player) > 0) then
			TriggerClientEvent("okokReports:NewFeedback", player, newFeedback);
		end 
	end 

	if Webhook ~= '' then
		newFeedbackWebhook(newFeedback)
	end
end)

-------------------------- FETCH FEEDBACK

RegisterNetEvent("okokReports:FetchFeedbackTable")
AddEventHandler("okokReports:FetchFeedbackTable", function()
	local staff = hasPermission(source)
	if staff then
		staffs[source] = true
		TriggerClientEvent("okokReports:FetchFeedbackTable", source, FeedbackTable, staff, oneSync)
	end
end)

-------------------------- ASSIST FEEDBACK

RegisterNetEvent("okokReports:AssistFeedback")
AddEventHandler("okokReports:AssistFeedback", function(feedbackId, canAssist)
	if staffs[source] then
		if canAssist then
			local id = FeedbackTable[feedbackId].playerid
			if GetPlayerPing(id) > 0 then
				local ped = GetPlayerPed(id)
				local playerCoords = GetEntityCoords(ped)
				local pedSource = GetPlayerPed(source)
				local identifierlist = ExtractIdentifiers(source)
				local assistFeedback = {
					feedbackid = feedbackId,
					discord = "<@"..identifierlist.discord:gsub("discord:", "")..">"
				}

				local playerEntity = exports.vCore:getPlayerEntityFromId(tonumber(source));
				local targetEntity = exports.vCore:getPlayerEntityFromId(tonumber(id));

				-- SetEntityCoords(pedSource, playerCoords.x, playerCoords.y, playerCoords.z)
				-- TriggerClientEvent('vrain_notify:showNotification', source, 'Elkezdtél elintézni egy jelentést. (#'..feedbackId..')', 'info', 10000)
				-- TriggerClientEvent('vrain_notify:showNotification', id, 'Egy adminisztrátor rád teleportált!', 'info', 10000)

				playerEntity.setPosition(targetEntity.getPosition());
				playerEntity.setDimension(targetEntity.getDimension());
				exports.vChat:outputChatBox(source, 'Elkezdtél elintézni egy jelentést. (#'..feedbackId..')', "info", "info");
				exports.vChat:outputChatBox(id, exports.vAdmin:getPlayerAdminName(tonumber(source)) .. ' elfogadta a reportodat és hozzád teleportált!', "info", "info");

				if Webhook ~= '' then
					assistFeedbackWebhook(assistFeedback)
				end
			else	
				exports.vChat:outputChatBox(source, "Ez a játékos nem található a szerveren", "error", "error");
				-- TriggerClientEvent('vrain_notify:showNotification', id, 'Ez a játékos nem található a szerveren!', 'error', 10000)
			end
			if not FeedbackTable[feedbackId].concluded then
				FeedbackTable[feedbackId].concluded = "assisting"
			end
			TriggerClientEvent("okokReports:FeedbackConclude", -1, feedbackId, FeedbackTable[feedbackId].concluded)
		end
	end
end)

-------------------------- CONCLUDE FEEDBACK

RegisterNetEvent("okokReports:FeedbackConclude")
AddEventHandler("okokReports:FeedbackConclude", function(feedbackId, canConclude)
	if staffs[source] then
		local feedback = FeedbackTable[feedbackId]
		local identifierlist = ExtractIdentifiers(source)
		local concludeFeedback = {
			feedbackid = feedbackId,
			discord = "<@"..identifierlist.discord:gsub("discord:", "")..">"
		}

		if feedback then
			if feedback.concluded ~= true or canConclude then
				if canConclude then
					if FeedbackTable[feedbackId].concluded == true then
						FeedbackTable[feedbackId].concluded = false
					else
						FeedbackTable[feedbackId].concluded = true
					end
				else
					FeedbackTable[feedbackId].concluded = true
				end
				TriggerClientEvent("okokReports:FeedbackConclude", -1, feedbackId, FeedbackTable[feedbackId].concluded)

				if Webhook ~= '' then
					concludeFeedbackWebhook(concludeFeedback)
				end
			end
		end
	end
end)

-------------------------- HAS PERMISSION

function hasPermission(id)
	local staff = false
	local xPlayer = ESX.GetPlayerFromId(id)
	if IsPlayerAceAllowed(id, "command.fix") then
		staff = true
	end
	return staff
end

-------------------------- IDENTIFIERS

function ExtractIdentifiers(id)
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }

    for i = 0, GetNumPlayerIdentifiers(id) - 1 do
        local playerID = GetPlayerIdentifier(id, i)

        if string.find(playerID, "steam") then
            identifiers.steam = playerID
        elseif string.find(playerID, "ip") then
            identifiers.ip = playerID
        elseif string.find(playerID, "discord") then
            identifiers.discord = playerID
        elseif string.find(playerID, "license") then
            identifiers.license = playerID
        elseif string.find(playerID, "xbl") then
            identifiers.xbl = playerID
        elseif string.find(playerID, "live") then
            identifiers.live = playerID
        end
    end

    return identifiers
end

-------------------------- NEW FEEDBACK WEBHOOK

function newFeedbackWebhook(data)
	if data.category == 'player_report' then
		category = 'Player Report'
	elseif data.category == 'question' then
		category = 'Question'
	else
		category = 'Bug'
	end

	local information = {
		{
			["color"] = Config.NewFeedbackWebhookColor,
			["author"] = {
				["icon_url"] = Config.IconURL,
				["name"] = Config.ServerName..' - Report',
			},
			["title"] = 'ÚJ JELENTÉS #'..data.feedbackid,
			["description"] = '**Tárgy:** '..data.subject..'\n**Leírás:** '..data.information..'\n\n**ID:** '..data.playerid..'\n**IDENTIFY:** '..data.identifier..'\n**Discord:** '..data.discord,
			["footer"] = {
				["text"] = os.date(Config.DateFormat),
			}
		}
	}
	PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.BotName, embeds = information}), {['Content-Type'] = 'application/json'})
end

-------------------------- ASSIST FEEDBACK WEBHOOK

function assistFeedbackWebhook(data)
	local information = {
		{
			["color"] = Config.AssistFeedbackWebhookColor,
			["author"] = {
				["icon_url"] = Config.IconURL,
				["name"] = Config.ServerName..' - Report',
			},
			["description"] = '**JELENTÉS #'..data.feedbackid..'** jelentés intézve általa: '..data.discord,
			["footer"] = {
				["text"] = os.date(Config.DateFormat),
			}
		}
	}
	PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.BotName, embeds = information}), {['Content-Type'] = 'application/json'})
end

-------------------------- CONCLUDE FEEDBACK WEBHOOK

function concludeFeedbackWebhook(data)
	local information = {
		{
			["color"] = Config.ConcludeFeedbackWebhookColor,
			["author"] = {
				["icon_url"] = Config.IconURL,
				["name"] = Config.ServerName..' - Report',
			},
			["description"] = '**JELENTÉS #'..data.feedbackid..'** lezárva, általa: '..data.discord,
			["footer"] = {
				["text"] = os.date(Config.DateFormat),
			}
		}
	}
	PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.BotName, embeds = information}), {['Content-Type'] = 'application/json'})
end