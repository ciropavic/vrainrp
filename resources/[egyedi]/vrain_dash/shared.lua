ADMIN_GROUPS = {
	admin = true,
	superadmin = true,
	moderator = true,
}

PREMIUM = {
	items = {
	},
	vehicles = {
		{
			name = "rmodgt63",
			price = 15000,
			img = "https://media.discordapp.net/attachments/821811915189256204/957325288423964692/unknown.png?width=1150&height=682"
		},
	},
	money = {
	},
}

function getItemImagePath(itemName)
	return "nui://esx_inventoryhud/html/img/items/" .. itemName .. ".png"
end

function getItemData(Item, typ)
	for _, item in pairs(PREMIUM[typ]) do
		if item.name == Item.name and item.price then
			return item
		end
	end

	return false
end

function secondsToClock(seconds)
	local seconds = tonumber(seconds)
	if not seconds then
		return "00:00:00"
	end

	if seconds <= 0 then
		return "00:00:00"
	end
	local hours = string.format("%02.f", math.floor(seconds / 3600))
	local mins = string.format("%02.f", math.floor(seconds / 60 - (hours * 60)))
	local secs = string.format("%02.f", math.floor(seconds - hours * 3600 - mins * 60))

	return hours .. ":" .. mins .. ":" .. secs
end

function chatbox(message, color, target)
	local msg = {
		color = color or { 255, 255, 255 },
		multiline = true,
		args = { "Szerver", message },
	}

	if IsDuplicityVersion() then
		TriggerClientEvent("chat:addMessage", target or -1, msg)
		return
	end

	TriggerEvent("chat:addMessage", msg)
end
