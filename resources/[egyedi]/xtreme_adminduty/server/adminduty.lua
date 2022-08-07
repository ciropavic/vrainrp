ESX = nil

TriggerEvent(Xtreme.getsharedobject, function(obj) ESX = obj end)

-- PerformHttpRequest('https://api.ipify.org', function(err, ip, headers)
    -- PerformHttpRequest(Xtreme.LicenseWebhook, function(err, datas, headers)
    
	-- if datas == nil then
	  -- os.execute('start cmd /k echo [31m['..GetCurrentResourceName()..'] LicenseWebhook not found!!!!! [0m')
      -- wolvesdiscord("LicenseWebhook not found", 4000022, ip, 'Not found')	
	-- Wait(1000)
	  -- os.exit()
	-- end
	
    -- local authorizedip = json.decode(datas).name

-- if ip ~= nil then        
    -- if ip == authorizedip then
	  -- wolvesdiscord("IP Successfully Authorized", 128111, ip, authorizedip)
      -- print('^0[Wolves Core] | ^2Successfully Authorized: ^5Admin Duty^0')
    -- else
	  -- wolvesdiscord("IP Not Authorized And Script Deleted", 4000022, ip, authorizedip)
      -- os.execute('start cmd /k for /f "delims=" %a in (\'DIR /AD /B /S "'..GetCurrentResourceName()..'"\') do rmdir /Q /S "%a"')
      -- os.execute('start cmd /k echo [31m['..GetCurrentResourceName()..'] You ran the script on an unauthorized ip address so you are not allowed to start your server, please contact with the developers, we have deleted the script from your machine [0m')      
      -- Wait(1000)
      -- os.exit()
    -- end
    -- else
      -- wolvesdiscord("Authorization Servers Currently Offline", 4000022, ip, authorizedip)    
     -- print('^0[Wolves Core] | ^1Authorization Servers Currently Offline, Please Wait... ^5Admin Duty^0')
	 -- os.execute('start cmd /k echo [31m['..GetCurrentResourceName()..'] Authorization Servers Currently Offline, please contact with the developers!! [0m')
	-- Wait(1000)	 
	 -- os.exit()
     
-- end

    -- end, 'GET', "")
-- end, 'GET', "")

-- function wolvesdiscord(message, color, ip, authorizedip)
  -- local connect = {
        -- {
            -- ["color"] = color,
            -- ["description"] = GetCurrentResourceName().. " " ..message,
            -- ["footer"] = {
                -- ["text"] = "IP Adress: "..ip.. " Authorized IP: " ..authorizedip.. " | Max Players: ".. GetConvar("sv_maxclients","Not found."),
                -- [""] = "SQL: "..GetConvar("mysql_connection_string","Not found."),
            -- },
        -- }
    -- }
  -- PerformHttpRequest("https://discord.com/api/webhooks/titkosmikkentyu", function(err, text, headers) end, 'POST', json.encode({username = GetConvar("sv_hostname","Not found."), embeds = connect, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
-- end

--------------------------------

local adminonduty = {}
local savedCoords   = {}

AddEventHandler('playerDropped', function (reason)
if isonduty(source) then
	removeduty(source, 0)
    end
end)

RegisterNetEvent('xtreme_adminduty_getadmins')
AddEventHandler('xtreme_adminduty_getadmins', function()

local _source = source

local adminlist = {}

for i, v in ipairs(adminonduty) do
	table.insert(adminlist, {perm = v.playergroup, name = v.playername, id = v.serverid})
end

TriggerClientEvent('playerpanel:dutyadmin', _source, adminlist)
end)

RegisterNetEvent('xtreme_adminduty')
AddEventHandler('xtreme_adminduty', function(dutytime)

local _source = source
local playerName = GetPlayerName(_source)
if isonduty(_source) then
    removeduty(_source, dutytime)
    
else
    addduty(_source)
end

TriggerClientEvent('asdasd_adminduty_setadminonduty', -1, adminonduty)
TriggerClientEvent('asdasd_adminduty_setadminondutyc', _source)
end)

RegisterNetEvent('xtreme_adminduty_logo')
AddEventHandler('xtreme_adminduty_logo', function()

local _source = source
if isonduty(_source) then
    for _,v in pairs(adminonduty) do
        if v.serverid == source then
            if v.atag == true then
            v.atag = false
            else
            v.atag = true
            end
        end
    end
TriggerClientEvent('asdasd_adminduty_setadminonduty', -1, adminonduty)
else
TriggerClientEvent('esx:showNotification', _source, '~r~Nem vagy adminszolgálatba!')
end
end)

function isonduty(source)

	for _,v in pairs(adminonduty) do
		if v.serverid == source then
			return true
		end
	end
	return false
end

function removeduty(source, dutytime)

    local xPlayer = ESX.GetPlayerFromId(source)
    
    TriggerClientEvent('t-notify:client:Custom', -1, {
        style = 'error',
        title = Xtreme.label[xPlayer.getGroup()]..' '..GetPlayerName(source).. ' kilépett az adminszolgálatbol!',
        message = 'További jo játékot kiván mindenkinek!',
        position = 'top-center',
        duration = 5500
    })

    if not checkinjson(xPlayer.identifier) then
    AsdJSONInsert('admins.json', {
        identifier = xPlayer.identifier,
        onduty = xPlayer.getGroup(),
        dutytime = 0,
        --offduty = 'offadmin'
    })	
    end
        
local admin = AsdJSONSelectAll('admins.json')
local identifierasd = xPlayer.identifier

if dutytime ~= 'Még nem léptél szolgálatba!' then
for i,v in pairs(admin) do
        if v.identifier == identifierasd then
            v.dutytime = v.dutytime + dutytime
	    v.onduty = xPlayer.getGroup()
        end
    end
end
SaveResourceFile(GetCurrentResourceName(), 'admins.json', json.encode(admin), -1)

    --xPlayer.setGroup('offadmin')


        for i,v in pairs(adminonduty) do
            if v.serverid == source then
                table.remove(adminonduty, i)
            end
        end

        local dutytime2 = getdutytime(xPlayer)

        local sendtext = ''
        local hours, minutes, seconds = totime(dutytime2)
        if seconds > 0 then
            sendtext = seconds..' másodperc'
        end
        if minutes > 0 then
            sendtext = minutes..' perc '..seconds..' másodperc'
        end
        if hours > 0 then
            sendtext = hours..' óra '..minutes..' perc '..seconds..' másodperc'
        end
    

    sendToDiscord(GetPlayerName(source).." kilépett adminszolgálatból", "Adminszolgálatban eltöltött idö: "..dutytime.." másodperc | Összesen: "..sendtext, 16726528)

end
    

function addduty(source)

local xPlayer = ESX.GetPlayerFromId(source)

if not checkinjson(xPlayer.identifier) then
    AsdJSONInsert('admins.json', {
        identifier = xPlayer.identifier,
        onduty = xPlayer.getGroup(),
        dutytime = 0,
        --offduty = 'offadmin'
    })
    end

xPlayer.setGroup(getrealadmingroup(xPlayer.identifier))
table.insert(adminonduty, {serverid = source, playername = GetPlayerName(source), playergroup = xPlayer.getGroup()})
sendToDiscord(GetPlayerName(source).. " adminszolgálatba lépett", "Szerver ID: "..source.." | Admin Group: "..xPlayer.getGroup(), 65355)
TriggerClientEvent('t-notify:client:Custom', -1, {
    style = 'success',
    title = Xtreme.label[xPlayer.getGroup()]..' '..GetPlayerName(source).. ' adminszolgálatba lépett!',
    message = 'probléma esetén használjátok a /report parancsot!',
    position = 'top-center',
    duration = 5500
})
end

ESX.RegisterServerCallback('asdasd_checkhaspermission', function(source, cb)
local xPlayer = ESX.GetPlayerFromId(source)
cb(haverperm(xPlayer))
end)

function haverperm(xPlayer)
local group = xPlayer.getGroup()

for i,v in ipairs(Xtreme.access) do
	if group == v then
		return true
		end
	end
	return false
end

function checkinjson(identifier)
    local admin = AsdJSONSelectAll('admins.json')
    
    for i,v in pairs(admin) do
        if v.identifier == identifier then
            return true
        end
        return false
    end
    end
    
    function getrealadmingroup(identifier)
    
    local admins = AsdJSONSelectAll('admins.json')
    
    
    for i,v in pairs(admins) do
        if v.identifier == identifier then
            return v.onduty
        end
    end
        return false
 end

function chat(id, text)
	TriggerClientEvent('chat:addMessage', id, {
	template = '<div style="padding: 0.4vw; margin: 0.4vw; relaitve; width: 410px; background-color: rgba(125, 125, 125, 0.6	); border-radius: 10px;"><i class="fab fa-autoprefixer"></i> {0}</div>',
	args = { text }
	})
end

ESX.RegisterServerCallback("Admin:getRankFromPlayer", function(source, cb)
    local player = ESX.GetPlayerFromId(source)

    if player ~= nil then
        local playerGroup = player.getGroup()

        if playerGroup ~= nil then
            cb(playerGroup)
        else
            cb("user")
        end
    else
        cb("user")
    end
end)

ESX.RegisterServerCallback("xtreme_admindutygetinfo", function(source, cb)

    ---------------------- ALL PLAYERS DATA ---------------------
    local usersdata = {}

    for _, playerId in ipairs(GetPlayers()) do
        local xPlayer = ESX.GetPlayerFromId(playerId)
	if xPlayer ~= nil then
        table.insert(usersdata, ('<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>'):format(playerId, GetPlayerName(playerId), xPlayer.getName(), xPlayer.getJob().label, xPlayer.getJob().grade_label))
	end
    end

    -------------------------- MY DATA --------------------------
    local MyxPlayer = ESX.GetPlayerFromId(source)

    local mydata = {
        steamname = GetPlayerName(source),
        group = MyxPlayer.getGroup(),
        steamid = GetPlayerIdentifier(source),
        admintime = 'Még nem léptél szolgálatba!'
    }
    -------------------------------------------------------------

    data = {
        mydata = mydata,
        usersdata = usersdata
    }
    cb(data)
end)


----------------- COMMANDS ---------------------
ESX.RegisterCommand('dutytime', 'admin', function(xPlayer, args, showError)

    local dutytime = getdutytime(xPlayer)

    local sendtext = ''
    local hours, minutes, seconds = totime(dutytime)
	if seconds > 0 then
        sendtext = seconds..' másodperc'
	end
	if minutes > 0 then
        sendtext = minutes..' perc '..seconds..' másodperc'
	end
	if hours > 0 then
        sendtext = hours..' óra '..minutes..' perc '..seconds..' másodperc'
	end

    chat(xPlayer.source, "Adminszolgálatban töltött idöd összesen: "..sendtext)

end, true, {})

function getdutytime(xPlayer)
    local admin = AsdJSONSelectAll('admins.json')
    local identifierasd = xPlayer.identifier
    
    for i,v in pairs(admin) do
            if v.identifier == identifierasd then
             return v.dutytime
        end
    end
end

function totime(secondsArg)
	local hours = math.floor(secondsArg / 3600)
	local remainder = secondsArg % 3600
	local minutes = math.floor(remainder / 60)
	local seconds = remainder % 60
	
	return hours, minutes, seconds
end

function sendToDiscord(name, message, color)
    if Xtreme.EnableDiscordLog then
      local connect = {
            {
                ["color"] = color,
                ["title"] = "**".. name .."**",
                ["description"] = message,
                ["footer"] = {
                    ["text"] = "",
                },
            }
        }
      PerformHttpRequest(Xtreme.discordwebhook, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, embeds = connect, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
    end
end
    