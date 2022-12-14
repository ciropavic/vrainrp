function createSQLColumn(name)
	local exists = MySQL.Sync.fetchScalar("SHOW COLUMNS FROM `users` LIKE '" .. name .. "'")
	if not exists then
		MySQL.Async.execute([[
			ALTER TABLE `users`
			ADD COLUMN `]] .. name .. [[` INT(11) NULL DEFAULT '0';
		]])
	end
end

CreateThread(function()
	createSQLColumn("playedTime")
	createSQLColumn("premiumPoints")

	for _, player in pairs(GetPlayers()) do
		local sb = Player(player).state

		if not sb.joinTime then
			Player(player).state.joinTime = os.time()
		end

		if not sb.playedTime then
			loadPlayerPlayedTime(player)
		end

		loadPlayerPP(player)
	end
end)

RegisterNetEvent(GetCurrentResourceName() .. "->playerLoaded", function()
	Player(source).state.joinTime = os.time()
	loadPlayerPlayedTime(source)
end)

function loadPlayerPlayedTime(player)
	local xPlayer = ESX.GetPlayerFromId(player)
	if not xPlayer then
		return
	end

	local playedTime = MySQL.Sync.fetchScalar(
		"SELECT playedTime FROM users WHERE identifier = ?",
		{ xPlayer.identifier }
	)
	Player(player).state.playedTime = playedTime
end

function savePlayedTime(player)
	local xPlayer = ESX.GetPlayerFromId(player)
	if not xPlayer then
		return
	end

	local sb = Player(player).state
	local oldTime = sb.playedTime or 0
	local joinTime = sb.joinTime or os.time()
	local newTime = oldTime + (os.time() - joinTime)

	MySQL.Async.execute("UPDATE users SET playedTime = ? WHERE identifier = ?", { newTime, xPlayer.identifier })
end

AddEventHandler("playerDropped", function()
	savePlayedTime(source)
end)

ESX.RegisterServerCallback("requestServerAdmins", function(source, cb)
	local result = {}

	for _, player in pairs(GetPlayers()) do
		player = tonumber(player);
		local admin = exports.vAdmin:getPlayerAdmin(player);

		if (admin and admin.level > 0) then
			table.insert(result, {
				id = player,
				group = exports.vAdmin:getPlayerAdminTitle(player),
				name = admin.name,
				duty = admin.duty
			});
		end
	end

	cb(result)
end)

ESX.RegisterServerCallback("requestPlayerDatas", function(source, cb)
	local result = {}

	local xPlayer = ESX.GetPlayerFromId(source)
	if not xPlayer then
		return cb({})
	end

	table.insert(result, { title = "ID", value = source })
	table.insert(result, { title = "Steam N??v", value = GetPlayerName(source) })
	table.insert(result, { title = "Sz??let??si id??", value = xPlayer.variables.dateofbirth })
	table.insert(result, { title = "Magass??g", value = xPlayer.variables.height .. "cm" })

	for _, account in pairs(xPlayer.accounts) do
		table.insert(
			result,
			{ title = account.label, value = account.money .. "$", color = account.money >= 0 and "#7946c5" or "#751212" }
		)
	end

	local currentPP = getPlayerPP(source)
	table.insert(result, {
		title = "Pr??mium Pont",
		value = currentPP .. "PP",
		color = currentPP >= 0 and "#7946c5" or "#751212",
	})

	local vehicleCount = MySQL.Sync.fetchScalar(
		"SELECT COUNT(*) FROM owned_vehicles WHERE owner = ?",
		{ xPlayer.identifier }
	)

	table.insert(result, { title = "J??rm??vek", value = vehicleCount .. "db" })

	local admin = exports.vAdmin:getPlayerAdmin(source);
	table.insert(result, {
		title = "Admin rang",
		value = (exports.vAdmin:getPlayerAdminTitle(source) or "J??t??kos") .. ((admin and admin.level) and " (" .. admin.level .. ")" or "")
	})
	table.insert(result, { title = "Munka", value = xPlayer.job and xPlayer.job.label or "Ismeretlen" })
	table.insert(result, { title = "Rang", value = xPlayer.job and xPlayer.job.grade_label or "Ismeretlen" })
	table.insert(
		result,
		{ title = "Fizet??s", value = xPlayer.job and xPlayer.job.grade_salary .. "$" or "Nincs ????", color = "#7946c5" }
	)

	table.insert(result, { title = "Identifier", value = xPlayer.identifier, color = "#7946c5", blur = true })

	local sb = Player(source).state
	local joinTime = sb.joinTime or os.time()
	local currentSessionTime = os.time() - joinTime
	local playedTime = (sb.playedTime or 0) + currentSessionTime

	table.insert(result, { title = "J??tszott id??", value = secondsToClock(playedTime), color = "#7946c5" })
	table.insert(result, { title = "Online Id??", value = secondsToClock(currentSessionTime), color = "#7946c5" })

	cb(result, xPlayer.getName())
end)

ESX.RegisterServerCallback("requestPlayerVehicles", function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	if not xPlayer then
		return cb({})
	end

	MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE owner = ?", { xPlayer.identifier }, function(result)
		cb(result)
	end)
end)

ESX.RegisterServerCallback("requestPremiumStuff", function(source, cb)
	local items = {}

	for _, item in pairs(PREMIUM.items) do
		item.label = ESX.GetItemLabel(item.name)

		if item.label then
			item.img = getItemImagePath(item.name)
			table.insert(items, item)
		end
	end

	cb(getPlayerPP(source), items)
end)

ESX.RegisterServerCallback("buyPremiumItem", function(source, cb, item, typ, label)
	local xPlayer = ESX.GetPlayerFromId(source)
	local currentPP = getPlayerPP(source)

	local item = getItemData(item, typ)
	if not item or not item.price then
		return cb(currentPP)
	end

	if currentPP <= item.price then
		return chatbox("Nincs el??g pr??mium pontod!", { 255, 0, 0 }, source)
	end

	if typ == "items" then
		if not xPlayer.canCarryItem(item.name, 1) then
			chatbox("T??rgy nemf??r el n??lad!", { 255, 0, 0 }, source)
			return cb(currentPP)
		end

		xPlayer.addInventoryItem(item.name, 1)
		takePlayerPP(source, item.price)
		chatbox("Sikeres v??s??rolt??l egy " .. ESX.GetItemLabel(item.name) .. " t??rgyat", { 0, 255, 0 }, source)
	elseif typ == "vehicles" then
		takePlayerPP(source, item.price)

		local plate = generatePlate()

		MySQL.Async.insert("INSERT INTO owned_vehicles SET owner = ?, plate = ?, vehicle = ?, storedAt = ?", {
			xPlayer.identifier,
			plate,
			json.encode({ model = GetHashKey(item.name), plate = plate }),
			os.time()
		})

		chatbox("Sikeres j??rm?? v??s??rl??s. Model: " .. label, { 0, 255, 0 }, source)

		return cb(getPlayerPP(source), { item = item, plate = plate })
	elseif typ == "money" then
		takePlayerPP(source, item.price)
		xPlayer.addMoney(item.name)

		chatbox("Sikeres v??s??rolt??l " .. item.name .. "$-t", { 0, 255, 0 }, source)
	end

	cb(getPlayerPP(source), spawnVehicle)
end)

function generatePlate()
	local plate = ""

	local str = "abcdefghijklmnopqrstuvwxyz"
	for index = 1, 3 do
		plate = plate .. string.char(str:byte(math.random(1, #str)))
	end

	plate = plate:upper() .. " "

	for index = 1, 3 do
		plate = plate .. math.random(0, 9)
	end

	if MySQL.Sync.fetchScalar("SELECT plate FROM owned_vehicles WHERE plate = ?", { plate }) then
		return generatePlate()
	end

	return plate
end
