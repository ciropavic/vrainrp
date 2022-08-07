ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local JoinCoolDown = {}
local BannedAlready = false
local BannedAlready2 = false
local isBypassing = false
local isBypassing2 = false
local DatabaseStuff = {}
local BannedAccounts = {}
local Admins = {
    "steam:11000010db93d2f",
    "steam:11000010019830b",
    "steam:110000133859f20",
    "steam:110000111c7a176",
    "steam:11000013ccead86",
    "steam:110000137467326",
    "steam:11000014c036676",
    "steam:11000014c5b7787",
    "steam:11000010412972f",
    "steam:11000013d0e983a",
    "steam:11000011406f5cd", -- Citrom10
}

AddEventHandler('esx:playerLoaded', function(source)
    local source = source
    local Steam = "NONE"
    local Lice = "NONE"
    local Live = "NONE"
    local Xbox = "NONE"
    local Discord = "NONE"
    local IP = "NONE"
    for k, v in ipairs(GetPlayerIdentifiers(source)) do
        if string.sub(v, 1,string.len("steam:")) == "steam:" then
            Steam = v
        elseif string.sub(v, 1,string.len("license:")) == "license:" then
            Lice = v
        elseif string.sub(v, 1,string.len("live:")) == "live:" then
            Live = v
        elseif string.sub(v, 1,string.len("xbl:")) == "xbl:" then
            Xbox = v
        elseif string.sub(v,1,string.len("discord:")) == "discord:" then
            Discord = v
        elseif string.sub(v, 1,string.len("ip:")) == "ip:" then
            IP = v
        end
    end
    if GetNumPlayerTokens(source) == 0 or GetNumPlayerTokens(source) == nil or GetNumPlayerTokens(source) < 0 or GetNumPlayerTokens(source) == "null" or GetNumPlayerTokens(source) == "**Invalid**" or not GetNumPlayerTokens(source) then
        DiscordLog(source, "Player Token Numbers Are Unknown")
        DropPlayer(source, "Vrain RolePlay: \n Probléma történt az adataid betöltése közben. \n Indítsd újra a játékot.")
        return
    end
    for a, b in pairs(BannedAccounts) do
        for c, d in pairs(b) do 
            for e, f in pairs(json.decode(d.Tokens)) do
                for g = 0, GetNumPlayerTokens(source) - 1 do
                    if GetPlayerToken(source, g) == f or d.License == tostring(Lice) or d.Live == tostring(Live) or d.Xbox == tostring(Xbox) or d.Discord == tostring(Discord) or d.IP == tostring(IP) or d.Steam == tostring(Steam) then
                        if os.time() < tonumber(d.Expire) then
                            BannedAlready2 = true
                            if d.Steam ~= tostring(Steam) then
                                isBypassing2 = true
                            end
                            break
                        else
                            CreateUnbanThread(tostring(d.Steam))
                            break
                        end
                    end
                end
            end
        end
    end
    if BannedAlready2 then
        BannedAlready2 = false
        DiscordLog(source, "Tried To Join But He/She Is Banned (Kicked From Server When Loaded Into Server(Was Banned))")
	    DropPlayer(source, "Ki vagy tiltva erről a szerverről. \n\nHa indokolatnak érzed a szankciót, kérjük keresd fel az adott Adminisztrátor a Discord szerverünkön.\n\nDiscord szerverünk: discord.gg/CdbMZ5MfR8")
    end
    if isBypassing2 then
        isBypassing2 = false
        DiscordLog(source, "Tried To Join Using Bypass Method (Changed Steam Hex(New Account Banned When Loaded To Server))")
        BanNewAccount(tonumber(source), "Tried To Bypass HR_BanSystem", os.time() + (300 * 86400))
	    DropPlayer(source, "Ki vagy tiltva erről a szerverről. \n\nHa indokolatnak érzed a szankciót, kérjük keresd fel az adott Adminisztrátor a Discord szerverünkön.\n\nDiscord szerverünk: discord.gg/CdbMZ5MfR8")
    end
end)

AddEventHandler('Initiate:BanSql', function(hex, id, reason, name, day)
    local time
    if tonumber(day) == 0 then
	time = 9999
    else
	time = day
   end
    MySQL.Async.execute('UPDATE hr_bansystem SET Reason = @Reason, isBanned = @isBanned, Expire = @Expire WHERE Steam = @Steam', 
    {
        ['@isBanned'] = 1,
        ['@Reason'] = reason,
        ['@Steam'] = hex,
        ['@Expire'] = os.time() + (time * 86400)
    })
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255, 131, 0, 0.4); border-radius: 3px;"><i class="fas fa-exclamation-triangle"></i> [Vrain]<br>  {1}</div>',
        args = { name, '^1' .. name .. ' ^0Kitiltva, Indok: ^1' ..reason.." ^0Időtartam: ^1"..time.." ^0 Nap."}
    })
    DropPlayer(id, reason)
    SetTimeout(5000, function()
        ReloadBans()
    end)
end)

AddEventHandler('TargetPlayerIsOffline', function(hex, reason, xAdmin, day)
    local Ttime
    if tonumber(day) == 0 then
	Ttime = 9999
    else
	Ttime = day
    end
    MySQL.Async.fetchAll('SELECT Steam FROM hr_bansystem WHERE Steam = @Steam',
    {
        ['@Steam'] = hex

    }, function(data)
        if data[1] then
            MySQL.Async.execute('UPDATE hr_bansystem SET Reason = @Reason, isBanned = @isBanned, Expire = @Expire WHERE Steam = @Steam', 
            {
                ['@isBanned'] = 1,
                ['@Reason'] = reason,
                ['@Steam'] = hex,
                ['@Expire'] = os.time() + (Ttime * 86400)
            })
            TriggerClientEvent('chat:addMessage', -1, {
                template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255, 131, 0, 0.4); border-radius: 3px;"><i class="fas fa-exclamation-triangle"></i> [Vrain]<br>  {1}</div>',
                args = { hex, '^1' .. hex .. ' ^0Kitiltva, Indok: ^1' ..reason.." ^0Időtartam: ^1"..Ttime.." ^0 Nap."}
            })
            SetTimeout(5000, function()
                ReloadBans()
            end)
        else
            TriggerClientEvent('chatMessage', xAdmin, "[Vrain]", {255, 0, 0}, "Nem található ilyen Steam Hex.")
        end
    end)
end)

AddEventHandler('playerConnecting', function(name, setKickReason)
    local source = source
    local Steam = "NONE"
    local Lice = "NONE"
    local Live = "NONE"
    local Xbox = "NONE"
    local Discord = "NONE"
    local IP = "NONE"
    for k, v in ipairs(GetPlayerIdentifiers(source)) do
        if string.sub(v, 1,string.len("steam:")) == "steam:" then
            Steam = v
        elseif string.sub(v, 1,string.len("license:")) == "license:" then
            Lice = v
        elseif string.sub(v, 1,string.len("live:")) == "live:" then
            Live = v
        elseif string.sub(v, 1,string.len("xbl:")) == "xbl:" then
            Xbox = v
        elseif string.sub(v,1,string.len("discord:")) == "discord:" then
            Discord = v
        elseif string.sub(v, 1,string.len("ip:")) == "ip:" then
            IP = v
        end
    end
    if Steam == nil or Lice == nil or Steam == "" or Lice == "" or Steam == "NONE" or Lice == "NONE" then
        setKickReason("\n \n Vrain RolePlay: \n Steam nem található, először indítsd el a Steam-et, majd a FiveM-et indítsd újra.")
        CancelEvent()
        return
    end
    if GetNumPlayerTokens(source) == 0 or GetNumPlayerTokens(source) == nil or GetNumPlayerTokens(source) < 0 or GetNumPlayerTokens(source) == "null" or GetNumPlayerTokens(source) == "**Invalid**" or not GetNumPlayerTokens(source) then
        DiscordLog(source, "Max Token Numbers Are nil")
        setKickReason("\n \n Vrain RolePlay: \n Probléma történt az adataid betöltése közben. \n Indítsd újra a játékot.")
        CancelEvent()
        return
    end
    if JoinCoolDown[Steam] == nil then
        JoinCoolDown[Steam] = os.time()
    elseif os.time() - JoinCoolDown[Steam] < 15 then 
        setKickReason("\n \n Vrain RolePlay: \n \n \n Kérlek várj egy pillanatot, amíg betölt a szerver.")
        CancelEvent()
        return
    else
        JoinCoolDown[Steam] = nil
    end
    for a, b in pairs(BannedAccounts) do
        for c, d in pairs(b) do 
            for e, f in pairs(json.decode(d.Tokens)) do
                for g = 0, GetNumPlayerTokens(source) - 1 do
                    if GetPlayerToken(source, g) == f or d.License == tostring(Lice) or d.Live == tostring(Live) or d.Xbox == tostring(Xbox) or d.Discord == tostring(Discord) or d.IP == tostring(IP) or d.Steam == tostring(Steam) then
                        if os.time() < tonumber(d.Expire) then
                            BannedAlready = true
                            if d.Steam ~= tostring(Steam) then
                                isBypassing = true
                            end
                            setKickReason("\n \n Vrain RolePlay: \n Ban ID: #"..d.ID.."\n Indok: "..d.Reason.."\n Lejárat: "..math.floor(((tonumber(d.Expire) - os.time())/86400)).." Nap! \nHWID: "..f)
                            CancelEvent()
                            break
                        else
                            CreateUnbanThread(tostring(d.Steam))
                            break
                        end
                    end
                end
            end
        end
    end
    if not BannedAlready and not isBypassing then
        InitiateDatabase(tonumber(source))
    end
    if BannedAlready then
        BannedAlready = false
        DiscordLog(source, "Tried To Join But He/She Is Banned (Rejected From Joining Before Loading Into Server)")
    end
    if isBypassing then
        isBypassing = false
        DiscordLog(source, "Tried To Join Using Bypass Method (Changed Steam Hex(New Account Banned Before Loading Into Server))")
        BanNewAccount(tonumber(source), "Tried To Bypass Bansystem", os.time() + (300 * 86400))
    end
end)

function CreateUnbanThread(Steam)
    MySQL.Async.fetchAll('SELECT Steam FROM hr_bansystem WHERE Steam = @Steam',
    {
        ['@Steam'] = Steam

    }, function(data)
        if data[1] then
            MySQL.Async.execute('UPDATE hr_bansystem SET Reason = @Reason, isBanned = @isBanned, Expire = @Expire WHERE Steam = @Steam', 
            {
                ['@isBanned'] = 0,
                ['@Reason'] = "",
                ['@Steam'] = Steam,
                ['@Expire'] = 0
            })
            SetTimeout(5000, function()
                ReloadBans()
            end)
        end
    end)
end

function InitiateDatabase(source)
    local source = source
    local ST = "None"
    local LC = "None"
    local LV = "None"
    local XB = "None"
    local DS = "None"
    local IiP = "None"
    for k, v in ipairs(GetPlayerIdentifiers(source)) do
        if string.sub(v, 1,string.len("steam:")) == "steam:" then
            ST  = v
        elseif string.sub(v, 1,string.len("license:")) == "license:" then
            LC  = v
        elseif string.sub(v, 1,string.len("live:")) == "live:" then
            LV  = v
        elseif string.sub(v, 1,string.len("xbl:")) == "xbl:" then
            Xbox = v
        elseif string.sub(v,1,string.len("discord:")) == "discord:" then
            DS = v
        elseif string.sub(v, 1,string.len("ip:")) == "ip:" then
            IiP = v
        end
    end
    if ST == "None" then print(source.." Failed To Create User") return end
    DatabaseStuff[ST] = {}
    for i = 0, GetNumPlayerTokens(source) - 1 do 
        table.insert(DatabaseStuff[ST], GetPlayerToken(source, i))
    end
    MySQL.Async.fetchAll('SELECT * FROM hr_bansystem WHERE Steam = @Steam',
    {
        ['@Steam'] = ST

    }, function(data) 
        if data[1] == nil then
            MySQL.Async.execute('INSERT INTO hr_bansystem (Steam, License, Tokens, Discord, IP, Xbox, Live, Reason, Expire, isBanned) VALUES (@Steam, @License, @Tokens, @Discord, @IP, @Xbox, @Live, @Reason, @Expire, @isBanned)',
            {
                ['@Steam'] = ST,
                ['@License'] = LC,
                ['@Discord'] = DS,
                ['@Xbox'] = XB,
                ['@IP'] = IiP,
                ['@Live'] = LV,
                ['@Reason'] = "",
                ['@Tokens'] = json.encode(DatabaseStuff[ST]),
                ['@Expire'] = 0,
                ['@isBanned'] = 0
            })
            DatabaseStuff[ST] = nil
        end 
    end)
end

function BanNewAccount(source, Reason, Time)
    local source = source
    local ST = "None"
    local LC = "None"
    local LV = "None"
    local XB = "None"
    local DS = "None"
    local IiP = "None"
    for k, v in ipairs(GetPlayerIdentifiers(source)) do
        if string.sub(v, 1,string.len("steam:")) == "steam:" then
            ST  = v
        elseif string.sub(v, 1,string.len("license:")) == "license:" then
            LC  = v
        elseif string.sub(v, 1,string.len("live:")) == "live:" then
            LV  = v
        elseif string.sub(v, 1,string.len("xbl:")) == "xbl:" then
            Xbox = v
        elseif string.sub(v,1,string.len("discord:")) == "discord:" then
            DS = v
        elseif string.sub(v, 1,string.len("ip:")) == "ip:" then
            IiP = v
        end
    end
    if ST == "None" then print(source.." Failed To Create User") return end
    DatabaseStuff[ST] = {}
    for i = 0, GetNumPlayerTokens(source) - 1 do 
        table.insert(DatabaseStuff[ST], GetPlayerToken(source, i))
    end
    MySQL.Async.fetchAll('SELECT * FROM hr_bansystem WHERE Steam = @Steam',
    {
        ['@Steam'] = ST

    }, function(data) 
        if data[1] == nil then
            MySQL.Async.execute('INSERT INTO hr_bansystem (Steam, License, Tokens, Discord, IP, Xbox, Live, Reason, Expire, isBanned) VALUES (@Steam, @License, @Tokens, @Discord, @IP, @Xbox, @Live, @Reason, @Expire, @isBanned)',
            {
                ['@Steam'] = ST,
                ['@License'] = LC,
                ['@Discord'] = DS,
                ['@Xbox'] = XB,
                ['@IP'] = IiP,
                ['@Live'] = LV,
                ['@Reason'] = Reason,
                ['@Tokens'] = json.encode(DatabaseStuff[ST]),
                ['@Expire'] = Time,
                ['@isBanned'] = 1
            })
            DatabaseStuff[ST] = nil
            SetTimeout(5000, function()
                ReloadBans()
            end)
        end 
    end)
end

RegisterCommand('banreload', function(source, args)
    if IsPlayerAllowedToBan(source) or source == 0 then
        ReloadBans()
        TriggerClientEvent('chatMessage', source, "[Vrain]", {255, 0, 0}, "Ban lista betöltve.")
    end
end)

RegisterServerEvent("HR_BanSystem:BanMe")
AddEventHandler("HR_BanSystem:BanMe", function(Reason, Time)
    local source = source
    for k, v in ipairs(GetPlayerIdentifiers(source)) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            Cheat = v
        end
    end
    TriggerEvent('Initiate:BanSql', Cheat, tonumber(source), tostring(Reason), GetPlayerName(source), tonumber(Time))
end)

function BanThis(source, Reason, Times)
    local time = Times
    for k, v in ipairs(GetPlayerIdentifiers(source)) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            STP = v
        end
    end
    if Times == nil or not Times then
        time = 365
    end
    TriggerEvent('Initiate:BanSql', STP, tonumber(source), tostring(Reason), GetPlayerName(source), tonumber(time))
end

RegisterCommand('ban', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local target = tonumber(args[1])
    if IsPlayerAllowedToBan(source) or source == 0 then
        if args[1] then
            if tonumber(args[2]) then
                if tostring(args[3]) then
                    if tonumber(args[1]) then
                        if GetPlayerName(target) then
                            for k, v in ipairs(GetPlayerIdentifiers(target)) do
                                if string.sub(v, 1, string.len("steam:")) == "steam:" then
                                    Hex = v
                                end
                            end
                            TriggerEvent('Initiate:BanSql', Hex, tonumber(target), table.concat(args, " ",3), GetPlayerName(target), tonumber(args[2]))
                        else
                            TriggerClientEvent('chatMessage', source, "[Vrain]", {255, 0, 0}, "Játékos nem található.")
                        end
                    else
                        if string.find(args[1], "steam:") ~= nil then
                            TriggerEvent('TargetPlayerIsOffline', args[1], table.concat(args, " ",3), tonumber(xPlayer.source), tonumber(args[2]))
                        else
                            TriggerClientEvent('chatMessage', source, "[Vrain]", {255, 0, 0}, "Hibás Steam Hex.")
                        end
                    end
                else
                    TriggerClientEvent('chatMessage', source, "[Vrain]", {255, 0, 0}, "Kérlek adj meg egy indokot..")
                end
            else
                TriggerClientEvent('chatMessage', source, "[Vrain]", {255, 0, 0}, "Kérlek adj meg egy időtartamot.")
            end
        else
            TriggerClientEvent('chatMessage', source, "[Vrain]", {255, 0, 0}, "Nem adtál meg ID-t, vagy Steam azonosítót.")
        end
    else
        if source ~= 0 then
            TriggerClientEvent('chatMessage', source, "[Vrain]", {255, 0, 0}, "Nincsen jogosultságod ehhez!")
        end
    end
end)

RegisterServerEvent("HR_BanSystem:CheckBan")
AddEventHandler("HR_BanSystem:CheckBan", function(hex)
    local source = source
    MySQL.Async.fetchAll('SELECT * FROM hr_bansystem WHERE Steam = @Steam',
    {
        ['@Steam'] = hex

    }, function(data)
        if data[1] then
            if data[1].isBanned == 1 then
                DiscordLog(source, "Tried To Bypass BanSystem(KVP Method)")
                DropPlayer(source, "Ki vagy tiltva erről a szerverről. \n\nHa indokolatnak érzed a szankciót, kérjük keresd fel az adott Adminisztrátor a Discord szerverünkön.\n\nDiscord szerverünk: discord.gg/CdbMZ5MfR8")
            end
        end
    end)
end)

RegisterCommand('unban', function(source, args)
    if IsPlayerAllowedToBan(source) or source == 0 then
        if tostring(args[1]) then
            MySQL.Async.fetchAll('SELECT Steam FROM hr_bansystem WHERE Steam = @Steam',
            {
                ['@Steam'] = args[1]
    
            }, function(data)
                if data[1] then
                    MySQL.Async.execute('UPDATE hr_bansystem SET Reason = @Reason, isBanned = @isBanned, Expire = @Expire WHERE Steam = @Steam', 
                    {
                        ['@isBanned'] = 0,
                        ['@Reason'] = "",
                        ['@Steam'] = args[1],
                        ['@Expire'] = 0
                    })
                    SetTimeout(5000, function()
                        ReloadBans()
                    end)
                    TriggerClientEvent('chatMessage', source, "[BanSystem]", {255, 0, 0}, "Tiltás feloldás megtörtént.")
                else
                    TriggerClientEvent('chatMessage', source, "[BanSystem]", {255, 0, 0}, "Hibás steam azonosító.")
                end
            end)
        else
            TriggerClientEvent('chatMessage', source, "[Vrain]", {255, 0, 0}, "Hibás steam azonosító.")
        end
    else
        if source ~= 0 then
            TriggerClientEvent('chatMessage', source, "[Vrain]", {255, 0, 0}, "Nincsen jogosultságod ehhez!")
        end
    end
end)

function ReloadBans()
    Citizen.CreateThread(function()
        BannedAccounts = {}
        MySQL.Async.fetchAll('SELECT * FROM hr_bansystem', {}, function(info)
            for i = 1, #info do
                if info[i].isBanned == 1 then
                    Citizen.Wait(2)
                    table.insert(BannedAccounts, {info[i]})
                end
            end
        end)
    end)
end

MySQL.ready(function()
	ReloadBans()
    print("Ban lista betöltve, jó játékot!")
end)

function IsPlayerAllowedToBan(player)
    local allowed = false
	for i, id in ipairs(Admins) do
		for x, pid in ipairs(GetPlayerIdentifiers(player)) do
			if string.lower(pid) == string.lower(id) then
				allowed = true
			end
		end
	end		
    return allowed
end

function DiscordLog(source, method)
    PerformHttpRequest('https://discord.com/api/webhooks/958789299858468915/z2Dv4S0Me8fNil8wLmTyWYo_OTf8indyAHyw059CJlavjM5Qj9bjjVSht1dt9bEH9B5s', function(err, text, headers)
    end, 'POST',
    json.encode({
    username = 'Player',
    embeds =  {{["color"] = 65280,
                ["author"] = {["name"] = 'VRAIN BANSYSTEM ',
                ["icon_url"] = ''},
                ["description"] = "** 🌐 Ban Log 🌐**\n```css\n[Tiltott]: " ..GetPlayerName(source).. "\n" .. "[ID]: " .. source.. "\n" .. "[Típus]: " .. method .. "\n```",
                ["footer"] = {["text"] = "© VRAIN ROLEPLAY- "..os.date("%x %X  %p"),
                ["icon_url"] = '',},}
                },
    avatar_url = ''
    }),
    {['Content-Type'] = 'application/json'
    })
end
