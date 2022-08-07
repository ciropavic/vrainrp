local IsChatVisible		= true;
local IsInputVisible 	= false;

local PredefinedColors = {
	server = "#975FEA",

	info = "#4a72ed",
	success = "#7cc576",
	error = "#a61e1e", 
};

-- https://fontawesome.com/v5/search
local PredefinedIcons = {
	info = "f05a", 
	success = "f00c", 
	error = "f00d", 

	server = "f233", 
	admin = "f505"
};

Citizen.CreateThread(function()
	while (true) do
		if (IsControlJustPressed(0, 245) and not IsInputVisible and IsChatVisible) then 
			IsInputVisible = true;
 
			SetNuiFocus(true, true);
			SendNUIMessage({
				action = "MODIFY_SETTINGS", 
				payload = { input_open = true }
			});
		end 

		Wait(0);
	end 
end);

-- RegisterCommand("valamihalo", function(...)
-- 	print("VETEL", ...)
-- end, false);

-- 
-- NUI Callbacks
-- 

RegisterNUICallback("loaded", function()
    -- print("REEEE");
end);

RegisterNUICallback("close_input", function()
    SetNuiFocus(false, false);
	IsInputVisible = false;
end);

RegisterNUICallback("execute_command", function(details)
	exports.vCore:useFetchAsync(
		"vAdmin::emitCommand", 
		function(success)
			if (not success) then 
				ExecuteCommand("/" .. details.command .. " " .. ((details and details.args and type(details.args) == "table") and table.concat(details.args, " ") or ""));
			end 
		end, 
		details.command, table.unpack(details.args)
	);
end);

-- 
-- Exports
-- 

function outputChatBox(text, color, icon)
	SendNUIMessage({
		action = "ADD_MESSAGE", 
		payload = {
			text = text, 
			color = (color and PredefinedColors[color]) and PredefinedColors[color] or color, 
			icon = (icon and PredefinedIcons[icon]) and PredefinedIcons[icon] or icon
		},
	});
end 
exports("outputChatBox", outputChatBox);

function addSuggestion(cmdWithArgs, description)
	SendNUIMessage({
		action = "ADD_SUGGESTION", 
		payload = {
			command = cmdWithArgs, 
			description = description
		},
	});

    return true;
end
exports("addSuggestion", addSuggestion);

function updateSetting(id, value)
	if (id == "visible") then 
		IsChatVisible = value;

		if (not value) then 
			SetNuiFocus(false, false);
		end 
	end 

	SendNUIMessage({
		action = "MODIFY_SETTINGS", 
		payload = {
			[id] = value
		},
	});

    return true;
end 
exports("updateSetting", updateSetting);

function clearChat()
	SendNUIMessage({
		action = "TRUNCATE_MESSAGES", 
		payload = { }
	});
end 
exports("clearChat", clearChat);

-- 
-- Events
-- 

RegisterNetEvent("vChat::receiveMessage");
AddEventHandler("vChat::receiveMessage", function(...)
	outputChatBox(...);
end);

RegisterNetEvent("vChat::addSuggestion");
AddEventHandler("vChat::addSuggestion", function(...)
	addSuggestion(...);
end);

RegisterNetEvent("vChat::receiveSuggestions");
AddEventHandler("vChat::receiveSuggestions", function(suggestions)
	for _, suggestion in ipairs(suggestions) do 
		addSuggestion(table.unpack(suggestion));
	end 
end);

RegisterNetEvent("vChat::clearChat");
AddEventHandler("vChat::clearChat", function()
	clearChat();
end);

--
-- Junk 
-- 

Citizen.CreateThread(function()
	TriggerServerEvent("global::fetchSuggestions");
end);