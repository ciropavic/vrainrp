webhookURL = "https://discord.com/api/webhooks/titkosmikkentyu"
if #webhookURL < 40 then 
    print("")
end
origin = Config.messagePrefix
displayIdentifiers = true;
discordInvite = Config.discordURL
if #Config.discordURL == 0 then
    discordInvite = '[DISCORD URL NOT SET]'
end
function GetPlayers()
    local players = {}
    for _, i in ipairs(GetActivePlayers()) do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end
    return players
end
RegisterCommand("kick", function(source, args, rawCommand)
    if #origin == 0 then
        Config.messagePrefix = 'command.kick'
        --print('^1Script Error: ^9[GravKick] ^5Please provide a valid prefix in config.lua ^1(Script will not work without it!)^0')
        --return;
    end
    if IsPlayerAceAllowed(source, "command.kick") == false then
        TriggerClientEvent('okokNotify:Alert', source, "HIBA", "Nincsen ehhez jogosultságod!", 5000, 'error')
        return;
    end
    if IsPlayerAceAllowed(source, "command.kick") then
        sm = stringsplit(rawCommand, " ");
        if #args < 2 then
            TriggerClientEvent('okokNotify:Alert', source, "HIBA", "Helytelen használat! (pl. /kick 2 AFK)", 5000, 'error')
    	    return;
        end
        id = sm[2]
        if GetPlayerIdentifiers(id)[1] == nil then
            TriggerClientEvent('okokNotify:Alert', source, "HIBA", "Hibás ID!", 3500, 'error')
    	    return;
        end
	    msg = ""
	    local message = ""
	        msg = msg .. " ^9(^6" .. GetPlayerName(source) .. "^9) ^1[^3" .. id .. "^1] "
	    for i = 3, #sm do
		    msg = msg .. sm[i] .. " "
		    message = message .. sm[i] .. " "
        end
	if IsPlayerAceAllowed(source, "command.kick") and tonumber(id) ~= nil then
		TriggerClientEvent("Reports:CheckPermission:Client", -1, msg, false)
        DropPlayer(id, 'Általa: ' .. GetPlayerName(source) .. ' \nIndok: ' .. message .. '\n\nHa indokolatnak érzed a szankciót, kérjük keresd fel az adott Adminisztrátor a Discord szerverünkön.\n\nDiscord szerverünk: '.. discordInvite .. '')
		local ids = ExtractIdentifiers(id);
		local steam = ids.steam:gsub("steam:", "");
		local steamDec = tostring(tonumber(steam,16));
		steam = "https://steamcommunity.com/profiles/" .. steamDec;
		local steamHex = ids.steam;
		local gameLicense = ids.license;
        local discord = ids.discord;
        if steamHex == nil then 
            steamHex = 'N/A'
            steam = 'N/A'
        end
        if discord == nil then
            discord = 'N/A'
        end
		sendToDisc("Player Kicked: _asd [ID: " .. id .. "]_", 
			'**Reason:** `' .. message .. '`\n' ..
			'\n' ..
            '**__Identifiers__**\n' ..
            '**Steam Hex:** `' .. steamHex .. '`' .. '\n' ..
            '**Steam Profile URL:** `' .. steam .. '`\n' ..
			'**FiveM License: **`' .. gameLicense .. '`\n' ..
			'**Discord Mention: **<@' .. discord:gsub('discord:', '') .. '>\n' ..
			'**Discord ID:** `' .. discord:gsub('discord:', '') .. '`', "Kicked By: " .. GetPlayerName(source) .. "[ID: " .. GetPlayerName(source) .. "]")
	end 
	else
		TriggerClientEvent('okokNotify:Alert', source, "HIBA", "Helytelen használat! (pl. /kick 2 AFK)", 5000, 'error')
    end
end)

embedColor = Config.embedColor
if #Config.embedColor == 0 then 
    embedColor = 16711680 -- Default color if none provided = red
end

embedName = Config.embedName
if #Config.embedName == 0 then
    embedName = 'github.com/Gravxd/FiveM-Kick-Command'
end

function sendToDisc(title, message, footer)
	local embed = {}
	embed = {
		{
			["color"] = embedColor, -- GREEN = 65280 --- RED = 16711680
			["title"] = "**".. title .."**",
			["description"] = "" .. message ..  "\nhttps://github.com/Gravxd/FiveM-Kick-Command",
			["footer"] = {
				["text"] = footer,
			},
		}
	}
	PerformHttpRequest("https://discord.com/api/webhooks/titkosmikkentyu", 
	function(err, text, headers) end, 'POST', json.encode({username = embedName, embeds = embed}), { ['Content-Type'] = 'application/json' })
end 

local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

function sleep (a) 
    local sec = tonumber(os.clock() + a); 
    while (os.clock() < sec) do 
    end 
end

hasPermission = {}
doesNotHavePermission = {}

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

function ExtractIdentifiers(src)
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }

    --Loop over all identifiers
    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)

        --Convert it to a nice table.
        if string.find(id, "steam") then
            identifiers.steam = id
        elseif string.find(id, "ip") then
            identifiers.ip = id
        elseif string.find(id, "discord") then
            identifiers.discord = id
        elseif string.find(id, "license") then
            identifiers.license = id
        elseif string.find(id, "xbl") then
            identifiers.xbl = id
        elseif string.find(id, "live") then
            identifiers.live = id
        end
    end

    return identifiers
end