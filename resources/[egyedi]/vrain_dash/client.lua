Panel = {
	visible = false,

	requestFunctions = {
		admins = function(cb)
			ESX.TriggerServerCallback("requestServerAdmins", function(result)
				cb({ admins = result })
			end)
		end,

		cards = function(cb)
			ESX.TriggerServerCallback("requestPlayerDatas", function(result, playerName)
				cb({ cards = result, playerName = playerName })
			end)
		end,

		property = function(cb)
			ESX.TriggerServerCallback("requestPlayerVehicles", function(result)
				local vehicles = {}

				for _, vehicleData in pairs(result) do
					if vehicleData and vehicleData.vehicle then
						local vehicle = json.decode(vehicleData.vehicle)
						local name = GetDisplayNameFromVehicleModel(vehicle.model)

						if (not name or name == "CARNOTFOUND") then 
							name = exports.skvehicleshop:getVehicleName(vehicle.model);
						end 

						if (not name or name == "CARNOTFOUND") then 
							name = "Ismeretlen";
						end 

						table.insert(vehicles, {
							plate = vehicleData.plate or "Ismeretlen",
							name = (name and name ~= "CARNOTFOUND") and name or "Ismeretlen",
							label = GetLabelText(name) or "Ismeretlen",
							state = math.floor((vehicle.bodyHealth or 1000) / 10),
							fuel = math.floor(vehicle.fuelLevel or 0),
							stored = (vehicleData.state or 0) == 1,
							vehicle = vehicle,
						})
					end
				end

				cb({ vehicles = vehicles })
			end)
		end,
	},

	init = function(self)
		RegisterCommand("dashboard", function()
			self:toggle()
		end)
		CreateThread(function()
			Wait(1)
			RegisterKeyMapping("dashboard", "Dashboard megnyitasa", "keyboard", "HOME")
		end)

		RegisterNUICallback("close", function(...)
			self:toggle(...)
		end)

		RegisterNUICallback("requestData", function(data, cb)
			self:request(data.name, cb)
		end)

		RegisterNUICallback("updateSetting", function(data)
			if not Settings[data.name] then
				return
			end

			local inputType = Settings[data.name].input_type;
			if (inputType == "checkbox") then 
				Settings[data.name].state = data.checked;
				Settings[data.name].callback(data.checked);
			elseif (inputType == "range") then 
				Settings[data.name].state = data.value;
				Settings[data.name].callback(data.value);
			end 

			if not data.storeLoad then
				TriggerEvent("dashboard:settingChanged", data.name, data.checked)
			end
		end)

		CreateThread(function()
			-- local settings = {}

			-- for _, name in ipairs(SettingsOrder) do 
			-- 	local data = Settings[name];
			-- 	if (data) then
			-- 		table.insert(settings, { 
			-- 			name = name, label = data.label, input_type = data.input_type, 
			-- 			minValue = data.minValue, maxValue = data.maxValue, 
			-- 			defaultValue = data.defaultValue 
			-- 		});
			-- 	end 
			-- end 

			-- SendNUIMessage({
			-- 	loadSettings = settings,
			-- })
		end)

		CreateThread(function()
			local money = {}
			local vehicles = {}

			for _, item in pairs(PREMIUM.money) do
				item.label = item.name .. "$"
				table.insert(money, item)
			end
			PREMIUM.money = money

			for _, vehicle in pairs(PREMIUM.vehicles) do
				vehicle.label = GetLabelText(vehicle.name) or "Ismeretlen"
				table.insert(vehicles, vehicle)
			end
			PREMIUM.vehicles = vehicles
		end)

		-- Premium shits
		RegisterNUICallback("getPremiumStuff", function(data, cb)
			ESX.TriggerServerCallback("requestPremiumStuff", function(currentPP, items)
				cb({
					currentPP = currentPP,
					items = items,
					vehicles = PREMIUM.vehicles,
					money = PREMIUM.money,
				})
			end)
		end)

		RegisterNUICallback("buyPremiumItem", function(data, cb)
			if not data.item then
				return cb({})
			end

			ESX.TriggerServerCallback("buyPremiumItem", function(currentPP, vehicleData)
				if vehicleData and vehicleData.item and vehicleData.plate then
					local playerPed = PlayerPedId()

					ESX.Game.SpawnVehicle(
						vehicleData.item.name,
						GetEntityCoords(playerPed) + vector3(0, 1.5, 0),
						GetEntityHeading(playerPed),
						function(vehicle)
							ESX.Game.SetVehicleProperties(vehicle, { plate = vehicleData.plate })
						end
					)
				end

				cb({ currentPP = currentPP })
			end, data.item, data.typ, data.item.label)
		end)

		RegisterNUICallback("fetchSettings", function(data, callback)
			local settings = {}

			for _, name in ipairs(SettingsOrder) do 
				local data = Settings[name];
				if (data) then
					table.insert(settings, { 
						name = name, label = data.label, input_type = data.input_type, 
						minValue = data.minValue, maxValue = data.maxValue, 
						defaultValue = data.defaultValue 
					});
				end 
			end 

			callback({
				settings = settings,
			})
		end);
	end,

	toggle = function(self)
		self.visible = not self.visible

		SendNUIMessage({
			visible = self.visible,
		})
		SetNuiFocus(self.visible, self.visible)

		if not self.visible then
			saveSettings()
		end
	end,

	request = function(self, name, cb)
		if not self.requestFunctions[name] then
			return cb({})
		end

		self.requestFunctions[name](cb)
	end,
}
Panel.__index = Panel

SettingsOrder = { "radar", "hud", "self_nametag", "chat_width", "chat_height", "chat_text_size" };
Settings = {
	radar = {
		label = "Radar megjelenítése",

		input_type = "checkbox", 
		state = true,
		defaultValue = true,

		callback = function(value)
			DisplayRadar(value)
		end,
	},
	
	hud = {
		label = "HUD megjelenítése",

		input_type = "checkbox", 
		state = true,
		defaultValue = true,
		
		callback = function(value)
			exports.vHud:setState(value);
		end,
	},
	
	self_nametag = {
		label = "Saját név megjelenítése",

		input_type = "checkbox", 
		state = true,
		defaultValue = true,

		callback = function(value)
			exports.vNametag:setState(value);
		end,
	},

	chat_width = {
		label = "Chat hosszúsága", 

		input_type = "range",
		state = 22, 
		defaultValue = 22, 
		minValue = 10, 
		maxValue = 50, 

		callback = function(value)
			exports.vChat:updateSetting("total_width", value);
		end
	},

	chat_height = {
		label = "Chat magassága", 

		input_type = "range",
		state = 50, 
		defaultValue = 50, 
		minValue = 10, 
		maxValue = 80, 

		callback = function(value)
			exports.vChat:updateSetting("total_height", value);
		end
	},

	chat_text_size = {
		label = "Chat üzenetek mérete", 

		input_type = "range",
		state = 9, 
		defaultValue = 9, 
		minValue = 5, 
		maxValue = 18, 

		callback = function(value)
			exports.vChat:updateSetting("text_size", value);
		end
	},
}

function saveSettings()
	local settings = {}

	for _, refId in pairs(Settings) do
		local setting = Settings[refId];
		if (setting) then 
			table.insert(settings, { name = refId, input_type = data.input_type, state = data.state })
		end 
	end

	SendNUIMessage({
		saveSettings = settings,
	})
end
exports("saveSettings", saveSettings)

function isSettingEnabled(name)
	return Settings[name] and Settings[name].state or false
end
exports("isSettingEnabled", isSettingEnabled)

--[[
	--Custom event for settings	
	RegisterNetEvent("dashboard:settingChanged", function(name, state)
		print(name, state)
	end)
]]

CreateThread(function()
	Wait(500)

	while not ESX.IsPlayerLoaded() do
		Wait(1)
	end

	Panel:init()
end)

RegisterNetEvent("esx:playerLoaded", function()
	TriggerServerEvent(GetCurrentResourceName() .. "->playerLoaded")
end)
