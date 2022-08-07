Citizen.CreateThread(function()
	Wait(1000)
	TriggerServerEvent("okokReports:FetchFeedbackTable")
end)

-------------------------- VARS

local oneSync = false
local FeedbackTable = {}
local canFeedback = true
local timeLeft = Config.FeedbackCooldown

-------------------------- COMMANDS

function openReportMenu()
	if canFeedback then
		FeedbackMenu(false)
	else
		exports['vrain_notify']:showNotify('Nem tudsz ilyen gyorsan reportot küldeni, kérlek várj egy kicsit!', 'warn', 10000)
	end
end 
RegisterNetEvent("report::openReportMenu");
AddEventHandler("report::openReportMenu", openReportMenu);

function openFeedbackMenu()
	FeedbackMenu(true);
end 
RegisterNetEvent("report::openFeedbackMenu");
AddEventHandler("report::openFeedbackMenu", openFeedbackMenu);

-------------------------- MENU

function FeedbackMenu(showAdminMenu)
	SetNuiFocus(true, true)
	if showAdminMenu then
		SendNUIMessage({
			action = "updateFeedback",
			FeedbackTable = FeedbackTable
		})
		SendNUIMessage({
			action = "OpenAdminFeedback",
		})
	else
		SendNUIMessage({
			action = "ClientFeedback",
		})
	end
end

-------------------------- EVENTS

RegisterNetEvent('okokReports:NewFeedback')
AddEventHandler('okokReports:NewFeedback', function(newFeedback)
	-- if staff then
		FeedbackTable[#FeedbackTable+1] = newFeedback
		exports['vrain_notify']:showNotify('Új report érkezett, valakinek segítségre van szüksége!', 'warn', 10000)
		exports.vChat:outputChatBox("Új report érkezett, valakinek segítségre van szüksége!", "server", "admin");
		SendNUIMessage({
			action = "updateFeedback",
			FeedbackTable = FeedbackTable
		})
	-- end
end)

RegisterNetEvent('okokReports:FetchFeedbackTable')
AddEventHandler('okokReports:FetchFeedbackTable', function(feedback, admin, oneS)
	FeedbackTable = feedback
	oneSync = oneS
end)

RegisterNetEvent('okokReports:FeedbackConclude')
AddEventHandler('okokReports:FeedbackConclude', function(feedbackID, info)
	local feedbackid = FeedbackTable[feedbackID]
	if (feedbackid) then 
		feedbackid.concluded = info

		SendNUIMessage({
			action = "updateFeedback",
			FeedbackTable = FeedbackTable
		})
	end 
end)

-------------------------- ACTIONS

RegisterNUICallback("action", function(data)
	if data.action ~= "concludeFeedback" then
		SetNuiFocus(false, false)
	end

	if data.action == "newFeedback" then
		exports['vrain_notify']:showNotify('A reportot sikeresen elküldtük az Adminisztrátor csapat felé, már csak várnod kell!', 'success', 5000)
		
		local feedbackInfo = {subject = data.subject, information = data.information, category = data.category}
		TriggerServerEvent("okokReports:NewFeedback", feedbackInfo)

		local time = Config.FeedbackCooldown * 60
		local pastTime = 0
		canFeedback = false

		while (time > pastTime) do
			Citizen.Wait(1000)
			pastTime = pastTime + 1
			timeLeft = time - pastTime
		end
		canFeedback = true
	elseif data.action == "assistFeedback" then
		if FeedbackTable[data.feedbackid] then
			if oneSync then
				TriggerServerEvent("okokReports:AssistFeedback", data.feedbackid, true)
			else
				local playerFeedbackID = FeedbackTable[data.feedbackid].playerid
				local playerID = GetPlayerFromServerId(playerFeedbackID)
				local playerOnline = NetworkIsPlayerActive(playerID)
				if playerOnline then
					SetEntityCoords(PlayerPedId(), GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerFeedbackID))))
					TriggerServerEvent("okokReports:AssistFeedback", data.feedbackid, true)
				else
					exports['vrain_notify']:showNotify('Ez a játékos már nincs a szerveren!', 'error', 4000)
				end
			end
		end
	elseif data.action == "concludeFeedback" then
		local feedbackID = data.feedbackid
		local canConclude = data.canConclude
		local feedbackInfo = FeedbackTable[feedbackID]
		if feedbackInfo then
			if feedbackInfo.concluded ~= true or canConclude then
				TriggerServerEvent("okokReports:FeedbackConclude", feedbackID, canConclude)
				exports['vrain_notify']:showNotify('Jelentés #'..feedbackID..' megoldva!', 'success', 4000)
			end
		end
	end
end)