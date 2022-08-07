ESX = nil
local xPlayer = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- SET NAME

RegisterCommand('setname', function(source, args, rawCommand)
    if IsPlayerAceAllowed(source, "command.adminparancsok") then
        local xPlayer = ESX.GetPlayerFromId(source)
        local tag = ""

        if xPlayer.getGroup() == "admin" then
            tag = "Admin"
        elseif xPlayer.getGroup() == "mod" then
            tag = "Moderátor"
        end

        if args[1] == nil then
            TriggerClientEvent('vrain_notify:showNotification', source, 'ID-t szükséges ehhez a parancshoz megadni!', 'error', 3000)
        elseif args[1] ~= nil then
            if args[2] ~= nil and args[3] ~= nil then
                local user = {}
                for k,v in pairs(GetPlayerIdentifiers(source)) do             
                    if string.sub(v, 1, string.len("steam:")) == "steam:" then -- Steam Hex
                        user.steamhex = string.sub(v, 7)
                    elseif string.sub(v, 1, string.len("license:")) == "license:" then -- Rockstar License
                        user.license = string.sub(v, 9)
                    elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then -- Xbox
                        user.xbox = string.sub(v, 5)
                    elseif string.sub(v, 1, string.len("ip:")) == "ip:" then -- Ip
                        user.ip = string.sub(v, 4)
                    elseif string.sub(v, 1, string.len("discord:")) == "discord:" then -- Discord ID
                        user.discord = string.sub(v, 9)
                    elseif string.sub(v, 1, string.len("live:")) == "live:" then -- Microsoft
                        user.microsoft = string.sub(v, 6)
                    end
                end

                local user2 = {}
                for k,v in pairs(GetPlayerIdentifiers(args[1])) do             
                    if string.sub(v, 1, string.len("steam:")) == "steam:" then -- Steam Hex
                        user2.steamhex = string.sub(v, 7)
                    elseif string.sub(v, 1, string.len("license:")) == "license:" then -- Rockstar License
                        user2.license = string.sub(v, 9)
                    elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then -- Xbox
                        user2.xbox = string.sub(v, 5)
                    elseif string.sub(v, 1, string.len("ip:")) == "ip:" then -- Ip
                        user2.ip = string.sub(v, 4)
                    elseif string.sub(v, 1, string.len("discord:")) == "discord:" then -- Discord ID
                        user2.discord = string.sub(v, 9)
                    elseif string.sub(v, 1, string.len("live:")) == "live:" then -- Microsoft
                        user2.microsoft = string.sub(v, 6)
                    end
                end
                local connect = {
                   {
                      ["color"] = 13112340,
                      ["title"] = "",
                      ["footer"] = {
                          ["text"] = os.date("%Y. %m. %d - %H:%M:%S"),
                      },
                      ["fields"] = {
                        {
                            ["name"] = "Admin",
                            ["value"] = "["..GetPlayerName(source).."](https://steamcommunity.com/profiles/"..GetSteamId64FromHex(user.steamhex)..")",
                            ["inline"] = true,
                        },
                        {
                            ["name"] = "Játékos",
                            ["value"] = "["..GetPlayerName(args[1]).."](https://steamcommunity.com/profiles/"..GetSteamId64FromHex(user2.steamhex)..")",
                            ["inline"] = true,
                        },
                        {
                            ["name"] = "Rang",
                            ["value"] = tag,
                            ["inline"] = true,
                        },
                        {
                            ["name"] = "Parancs",
                            ["value"] = "`/setname `".. args[1] .. " ".. args[2] .. " ".. args[3],
                            ["inline"] = false,
                        },
                        {
                            ["name"] = "​",
                            ["value"] = "​",
                            ["inline"] = false,
                        },
                        {
                            ["name"] = "Licensz",
                            ["value"] = user2.license,
                            ["inline"] = false,
                        },
                        {
                            ["name"] = "SteamHEX",
                            ["value"] = "steam:"..user2.steamhex,
                            ["inline"] = false,
                        },
                        {
                            ["name"] = "SteamID",
                            ["value"] = "[".. GetSteamId64FromHex(user2.steamhex) .."](https://steamcommunity.com/profiles/".. GetSteamId64FromHex(user2.steamhex) ..")",
                            ["inline"] = false,
                        },
                        {
                            ["name"] = "Discord",
                            ["value"] = "<@"..user2.discord..">",
                            ["inline"] = false,
                        },
                    },
                  },
                }
                PerformHttpRequest(Config.DCWebhook, function(err, text, headers) end, 'POST', json.encode({username = Config.DCName, embeds = connect, avatar_url = Config.DCImage}), { ['Content-Type'] = 'application/json' })

                TriggerClientEvent('chat:addMessage', source, {
                    template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(47, 160, 255, 0.9); border-radius: 8px;"><span style ="color: black"><i class="fas fa-info-circle"></i></span><span style="color:white"> {0}</span><span style="color:black"> nevét megváltoztattad. ({1} {2})</div>',
                    args = { GetPlayerName(args[1]), args[2], args[3] }
                })
                TriggerClientEvent('vrain_notify:showNotification', source, ''..GetPlayerName(args[1])..' nevét megváltoztattad '..args[2]..' '..args[3]..' névre.', 'error', 3000)

                TriggerClientEvent('chat:addMessage', args[1], {
                    template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(47, 160, 255, 0.9); border-radius: 8px;"><span style ="color: black"><i class="fas fa-info-circle"></i></span><span style="color:white"> {0}</span><span style="color:black"> megváltoztatta a nevedet. ({1} {2})</div>',
                    args = { GetPlayerName(source), args[2], args[3] }
                })
                TriggerClientEvent('vrain_notify:showNotification', args[1], ''..GetPlayerName(args[1])..' megváltoztata a nevedet '..args[2]..' '..args[3]..' névre.', 'error', 3000)
                MySQL.Async.execute('UPDATE users SET firstname=@firstname,lastname = @lastname WHERE identifier = @identifier', {
                    ['@identifier'] = ESX.GetIdentifier(args[1]),
                    ['@firstname'] = tostring(args[2]),
                    ['@lastname'] = tostring(args[3]),
                })
            else
                TriggerClientEvent('vrain_notify:showNotification', source, '/setname [id] [keresztnév] [vezetéknév]', 'error', 3000)
            end
        end
    else
        TriggerClientEvent('chat:addMessage', source, {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(234, 42, 38, 0.7); border-radius: 8px;"><span style ="color: black"><i class="fas fa-exclamation-triangle"></i> Nincs jogosultságod ehhez!</span></div>',
            args = {  }
        })
    end
end)


-- SET BIRTHDAY

RegisterCommand('setbirth', function(source, args, rawCommand)
    if IsPlayerAceAllowed(source, "command.adminparancsok") then
        local xPlayer = ESX.GetPlayerFromId(source)
        local tag = ""

        if xPlayer.getGroup() == "admin" then
            tag = "Admin"
        elseif xPlayer.getGroup() == "mod" then
            tag = "Moderátor"
        end
        if args[1] == nil then
            TriggerClientEvent('vrain_notify:showNotification', source, 'ID-t szükséges ehhez a parancshoz megadni!', 'error', 3000)
        elseif args[1] ~= nil then
            if args[2] ~= nil then
                local user = {}
                for k,v in pairs(GetPlayerIdentifiers(source)) do             
                    if string.sub(v, 1, string.len("steam:")) == "steam:" then -- Steam Hex
                        user.steamhex = string.sub(v, 7)
                    elseif string.sub(v, 1, string.len("license:")) == "license:" then -- Rockstar License
                        user.license = string.sub(v, 9)
                    elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then -- Xbox
                        user.xbox = string.sub(v, 5)
                    elseif string.sub(v, 1, string.len("ip:")) == "ip:" then -- Ip
                        user.ip = string.sub(v, 4)
                    elseif string.sub(v, 1, string.len("discord:")) == "discord:" then -- Discord ID
                        user.discord = string.sub(v, 9)
                    elseif string.sub(v, 1, string.len("live:")) == "live:" then -- Microsoft
                        user.microsoft = string.sub(v, 6)
                    end
                end

                local user2 = {}
                for k,v in pairs(GetPlayerIdentifiers(args[1])) do             
                    if string.sub(v, 1, string.len("steam:")) == "steam:" then -- Steam Hex
                        user2.steamhex = string.sub(v, 7)
                    elseif string.sub(v, 1, string.len("license:")) == "license:" then -- Rockstar License
                        user2.license = string.sub(v, 9)
                    elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then -- Xbox
                        user2.xbox = string.sub(v, 5)
                    elseif string.sub(v, 1, string.len("ip:")) == "ip:" then -- Ip
                        user2.ip = string.sub(v, 4)
                    elseif string.sub(v, 1, string.len("discord:")) == "discord:" then -- Discord ID
                        user2.discord = string.sub(v, 9)
                    elseif string.sub(v, 1, string.len("live:")) == "live:" then -- Microsoft
                        user2.microsoft = string.sub(v, 6)
                    end
                end
                local connect = {
                {
                    ["color"] = 13112340,
                    ["title"] = "",
                    ["footer"] = {
                        ["text"] = os.date("%Y. %m. %d - %H:%M:%S"),
                    },
                    ["fields"] = {
                        {
                            ["name"] = "Admin",
                            ["value"] = "["..GetPlayerName(source).."](https://steamcommunity.com/profiles/"..GetSteamId64FromHex(user.steamhex)..")",
                            ["inline"] = true,
                        },
                        {
                            ["name"] = "Játékos",
                            ["value"] = "["..GetPlayerName(args[1]).."](https://steamcommunity.com/profiles/"..GetSteamId64FromHex(user2.steamhex)..")",
                            ["inline"] = true,
                        },
                        {
                            ["name"] = "Rang",
                            ["value"] = tag,
                            ["inline"] = true,
                        },
                        {
                            ["name"] = "Parancs",
                            ["value"] = "`/setbrith `".. args[1] .. " ".. args[2],
                            ["inline"] = false,
                        },
                        {
                            ["name"] = "​",
                            ["value"] = "​",
                            ["inline"] = false,
                        },
                        {
                            ["name"] = "Licensz",
                            ["value"] = user2.license,
                            ["inline"] = false,
                        },
                        {
                            ["name"] = "SteamHEX",
                            ["value"] = "steam:"..user2.steamhex,
                            ["inline"] = false,
                        },
                        {
                            ["name"] = "SteamID",
                            ["value"] = "[".. GetSteamId64FromHex(user2.steamhex) .."](https://steamcommunity.com/profiles/".. GetSteamId64FromHex(user2.steamhex) ..")",
                            ["inline"] = false,
                        },
                        {
                            ["name"] = "Discord",
                            ["value"] = "<@"..user2.discord..">",
                            ["inline"] = false,
                        },
                    },
                },
                }
                PerformHttpRequest(Config.DCWebhook, function(err, text, headers) end, 'POST', json.encode({username = Config.DCName, embeds = connect, avatar_url = Config.DCImage}), { ['Content-Type'] = 'application/json' })
                TriggerClientEvent('chat:addMessage', source, {
                    template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(47, 160, 255, 0.9); border-radius: 8px;"><span style ="color: black"><i class="fas fa-info-circle"></i> Megváltoztattad</span><span style="color:white"> {0}</span><span style="color:black"> születési dátumát. ({1})</div>',
                    args = { GetPlayerName(args[1]), args[2] }
                })

                TriggerClientEvent('chat:addMessage', args[1], {
                    template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(47, 160, 255, 0.9); border-radius: 8px;"><span style ="color: black"><i class="fas fa-info-circle"></i></span><span style="color:white"> {0}</span><span style="color:black"> megváltoztatta a születési dátumodat. ({1})</div>',
                    args = { GetPlayerName(source), args[2] }
                })
                MySQL.Async.execute('UPDATE users SET dateofbirth=@dateofbirth WHERE identifier = @identifier', {
                    ['@identifier'] = ESX.GetIdentifier(args[1]),
                    ['@dateofbirth'] = tostring(args[2]),
                })
            else
                TriggerClientEvent('vrain_notify:showNotification', source, '/setbirth [id] [Date (0000-00-00)]', 'error', 3000)
            end
        end
    else
        TriggerClientEvent('chat:addMessage', source, {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(234, 42, 38, 0.7); border-radius: 8px;"><span style ="color: black"><i class="fas fa-exclamation-triangle"></i> Nincs jogosultságod ehhez!</span></div>',
            args = {  }
        })
    end
end)



-- SET HEIGHT

RegisterCommand('setheight', function(source, args, rawCommand)
    if IsPlayerAceAllowed(source, "command.adminparancsok") then
        local xPlayer = ESX.GetPlayerFromId(source)
        local tag = ""

        if xPlayer.getGroup() == "admin" then
            tag = "Admin"
        elseif xPlayer.getGroup() == "mod" then
            tag = "Moderátor"
        end
        if args[1] == nil then
            TriggerClientEvent('vrain_notify:showNotification', source, 'ID-t szükséges ehhez a parancshoz megadni!', 'error', 3000)
        elseif args[1] ~= nil then
            if args[2] ~= nil then

                TriggerClientEvent('chat:addMessage', source, {
                    template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(47, 160, 255, 0.9); border-radius: 8px;"><span style ="color: black"><i class="fas fa-info-circle"></i> Megváltoztattad</span><span style="color:white"> {0}</span><span style="color:black"> magasságát. ({1}cm)</div>',
                    args = { GetPlayerName(args[1]), args[2] }
                })

                local user = {}
                for k,v in pairs(GetPlayerIdentifiers(source)) do             
                    if string.sub(v, 1, string.len("steam:")) == "steam:" then -- Steam Hex
                        user.steamhex = string.sub(v, 7)
                    elseif string.sub(v, 1, string.len("license:")) == "license:" then -- Rockstar License
                        user.license = string.sub(v, 9)
                    elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then -- Xbox
                        user.xbox = string.sub(v, 5)
                    elseif string.sub(v, 1, string.len("ip:")) == "ip:" then -- Ip
                        user.ip = string.sub(v, 4)
                    elseif string.sub(v, 1, string.len("discord:")) == "discord:" then -- Discord ID
                        user.discord = string.sub(v, 9)
                    elseif string.sub(v, 1, string.len("live:")) == "live:" then -- Microsoft
                        user.microsoft = string.sub(v, 6)
                    end
                end

                local user2 = {}
                for k,v in pairs(GetPlayerIdentifiers(args[1])) do             
                    if string.sub(v, 1, string.len("steam:")) == "steam:" then -- Steam Hex
                        user2.steamhex = string.sub(v, 7)
                    elseif string.sub(v, 1, string.len("license:")) == "license:" then -- Rockstar License
                        user2.license = string.sub(v, 9)
                    elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then -- Xbox
                        user2.xbox = string.sub(v, 5)
                    elseif string.sub(v, 1, string.len("ip:")) == "ip:" then -- Ip
                        user2.ip = string.sub(v, 4)
                    elseif string.sub(v, 1, string.len("discord:")) == "discord:" then -- Discord ID
                        user2.discord = string.sub(v, 9)
                    elseif string.sub(v, 1, string.len("live:")) == "live:" then -- Microsoft
                        user2.microsoft = string.sub(v, 6)
                    end
                end
                local connect = {
                {
                    ["color"] = 13112340,
                    ["title"] = "",
                    ["footer"] = {
                        ["text"] = os.date("%Y. %m. %d - %H:%M:%S"),
                    },
                    ["fields"] = {
                        {
                            ["name"] = "Admin",
                            ["value"] = "["..GetPlayerName(source).."](https://steamcommunity.com/profiles/"..GetSteamId64FromHex(user.steamhex)..")",
                            ["inline"] = true,
                        },
                        {
                            ["name"] = "Játékos",
                            ["value"] = "["..GetPlayerName(args[1]).."](https://steamcommunity.com/profiles/"..GetSteamId64FromHex(user2.steamhex)..")",
                            ["inline"] = true,
                        },
                        {
                            ["name"] = "Rang",
                            ["value"] = tag,
                            ["inline"] = true,
                        },
                        {
                            ["name"] = "Parancs",
                            ["value"] = "`/setheight `".. args[1] .. " ".. args[2],
                            ["inline"] = false,
                        },
                        {
                            ["name"] = "​",
                            ["value"] = "​",
                            ["inline"] = false,
                        },
                        {
                            ["name"] = "Licensz",
                            ["value"] = user2.license,
                            ["inline"] = false,
                        },
                        {
                            ["name"] = "SteamHEX",
                            ["value"] = "steam:"..user2.steamhex,
                            ["inline"] = false,
                        },
                        {
                            ["name"] = "SteamID",
                            ["value"] = "[".. GetSteamId64FromHex(user2.steamhex) .."](https://steamcommunity.com/profiles/".. GetSteamId64FromHex(user2.steamhex) ..")",
                            ["inline"] = false,
                        },
                        {
                            ["name"] = "Discord",
                            ["value"] = "<@"..user2.discord..">",
                            ["inline"] = false,
                        },
                    },
                },
                }
                PerformHttpRequest(Config.DCWebhook, function(err, text, headers) end, 'POST', json.encode({username = Config.DCName, embeds = connect, avatar_url = Config.DCImage}), { ['Content-Type'] = 'application/json' })

                TriggerClientEvent('chat:addMessage', args[1], {
                    template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(47, 160, 255, 0.9); border-radius: 8px;"><span style ="color: black"><i class="fas fa-info-circle"></i></span><span style="color:white"> {0}</span><span style="color:black"> megváltoztatta a magasságodat. ({1}cm)</div>',
                    args = { GetPlayerName(source), args[2] }
                })
                TriggerClientEvent('vrain_notify:showNotification', args[1], ''..GetPlayerName(source)..' megváltoztatta a magasságodat '..args[2]..'cm-re.', 'success', 3000)

                MySQL.Async.execute('UPDATE users SET height=@height WHERE identifier = @identifier', {
                    ['@identifier'] = ESX.GetIdentifier(args[1]),
                    ['@height'] = tostring(args[2]),
                })
            else
                TriggerClientEvent('vrain_notify:showNotification', source, '/setheight [id] [Magasság (140-220cm)]', 'error', 3000)
            end
        end
    else
        TriggerClientEvent('vrain_notify:showNotification', source, 'Nincsen jogosultságod ehhez!', 'error', 5000)
    end
end)



-- GIVE LICENSE

RegisterCommand('givelicense', function(source, args, rawCommand)
    if IsPlayerAceAllowed(source, "command.adminparancsok") then
        local xPlayer = ESX.GetPlayerFromId(source)
        local tag = ""

        if xPlayer.getGroup() == "admin" then
            tag = "Admin"
        elseif xPlayer.getGroup() == "mod" then
            tag = "Moderátor"
        end
        if args[1] == nil then
            TriggerClientEvent('vrain_notify:showNotification', source, 'ID-t szükséges ehhez a parancshoz megadni!', 'error', 3000)
        elseif args[1] ~= nil then
            if args[2] ~= nil then
                if args[2] == "boat" then
                    TriggerEvent('esx_license:addLicense', args[1], 'boat')
                elseif args[2] == "dmv" then
                    TriggerEvent('esx_license:addLicense', args[1], 'dmv')
                elseif args[2] == "drive" then
                    TriggerEvent('esx_license:addLicense', args[1], 'drive')
                elseif args[2] == "drive_bike" then
                    TriggerEvent('esx_license:addLicense', args[1], 'drive_bike')
                elseif args[2] == "drive_truck" then
                    TriggerEvent('esx_license:addLicense', args[1], 'drive_truck')
                elseif args[2] == "weapon" then
                    TriggerEvent('esx_license:addLicense', args[1], 'weapon')
                end
                local user = {}
                for k,v in pairs(GetPlayerIdentifiers(source)) do             
                    if string.sub(v, 1, string.len("steam:")) == "steam:" then -- Steam Hex
                        user.steamhex = string.sub(v, 7)
                    elseif string.sub(v, 1, string.len("license:")) == "license:" then -- Rockstar License
                        user.license = string.sub(v, 9)
                    elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then -- Xbox
                        user.xbox = string.sub(v, 5)
                    elseif string.sub(v, 1, string.len("ip:")) == "ip:" then -- Ip
                        user.ip = string.sub(v, 4)
                    elseif string.sub(v, 1, string.len("discord:")) == "discord:" then -- Discord ID
                        user.discord = string.sub(v, 9)
                    elseif string.sub(v, 1, string.len("live:")) == "live:" then -- Microsoft
                        user.microsoft = string.sub(v, 6)
                    end
                end

                local user2 = {}
                for k,v in pairs(GetPlayerIdentifiers(args[1])) do             
                    if string.sub(v, 1, string.len("steam:")) == "steam:" then -- Steam Hex
                        user2.steamhex = string.sub(v, 7)
                    elseif string.sub(v, 1, string.len("license:")) == "license:" then -- Rockstar License
                        user2.license = string.sub(v, 9)
                    elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then -- Xbox
                        user2.xbox = string.sub(v, 5)
                    elseif string.sub(v, 1, string.len("ip:")) == "ip:" then -- Ip
                        user2.ip = string.sub(v, 4)
                    elseif string.sub(v, 1, string.len("discord:")) == "discord:" then -- Discord ID
                        user2.discord = string.sub(v, 9)
                    elseif string.sub(v, 1, string.len("live:")) == "live:" then -- Microsoft
                        user2.microsoft = string.sub(v, 6)
                    end
                end
                local connect = {
                {
                    ["color"] = 13112340,
                    ["title"] = "",
                    ["footer"] = {
                        ["text"] = os.date("%Y. %m. %d - %H:%M:%S"),
                    },
                    ["fields"] = {
                        {
                            ["name"] = "Admin",
                            ["value"] = "["..GetPlayerName(source).."](https://steamcommunity.com/profiles/"..GetSteamId64FromHex(user.steamhex)..")",
                            ["inline"] = true,
                        },
                        {
                            ["name"] = "Játékos",
                            ["value"] = "["..GetPlayerName(args[1]).."](https://steamcommunity.com/profiles/"..GetSteamId64FromHex(user2.steamhex)..")",
                            ["inline"] = true,
                        },
                        {
                            ["name"] = "Rang",
                            ["value"] = tag,
                            ["inline"] = true,
                        },
                        {
                            ["name"] = "Parancs",
                            ["value"] = "`/givelicense `".. args[1] .. " ".. args[2],
                            ["inline"] = false,
                        },
                        {
                            ["name"] = "​",
                            ["value"] = "​",
                            ["inline"] = false,
                        },
                        {
                            ["name"] = "Licensz",
                            ["value"] = user2.license,
                            ["inline"] = false,
                        },
                        {
                            ["name"] = "SteamHEX",
                            ["value"] = "steam:"..user2.steamhex,
                            ["inline"] = false,
                        },
                        {
                            ["name"] = "SteamID",
                            ["value"] = "[".. GetSteamId64FromHex(user2.steamhex) .."](https://steamcommunity.com/profiles/".. GetSteamId64FromHex(user2.steamhex) ..")",
                            ["inline"] = false,
                        },
                        {
                            ["name"] = "Discord",
                            ["value"] = "<@"..user2.discord..">",
                            ["inline"] = false,
                        },
                    },
                },
                }
                PerformHttpRequest(Config.DCWebhook, function(err, text, headers) end, 'POST', json.encode({username = Config.DCName, embeds = connect, avatar_url = Config.DCImage}), { ['Content-Type'] = 'application/json' })
                TriggerClientEvent('chat:addMessage', source, {
                    template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(47, 160, 255, 0.9); border-radius: 8px;"><span style ="color: black"><i class="fas fa-info-circle"></i> Adtál neki egy engedélyt:</span><span style="color:white"> {0}</span><span style="color:black"> ({1})</div>',
                    args = { GetPlayerName(args[1]), args[2] }
                })
                TriggerClientEvent('chat:addMessage', args[1], {
                    template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(47, 160, 255, 0.9); border-radius: 8px;"><span style ="color: black"><i class="fas fa-info-circle"></i></span><span style="color:white"> {0}</span><span style="color:black"> adott neked egy engedélyt. ({1})</div>',
                    args = { GetPlayerName(source), args[2] }
                })
            else
                TriggerClientEvent('vrain_notify:showNotification', source, '/givelicense [id] [boat/dmv/drive/drive_bike/drive_truck/weapon]', 'info', 3000)
            end
        end
    else
        TriggerClientEvent('vrain_notify:showNotification', source, 'Nincsen jogosultságod ehhez!', 'error', 3000)
    end
end)


-- FIX AND CLEAN

RegisterCommand('fix', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)

    if IsPlayerAceAllowed(source, "command.fix") then
        TriggerClientEvent('nl:fix', source)
        TriggerClientEvent('vrain_notify:showNotification', source, 'Sikeresen megjavítottad a járművet!', 'success', 3000)
    end
end)

RegisterCommand('clean', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)

    if IsPlayerAceAllowed(source, "command.clean") then
        TriggerClientEvent('nl:clean', source)
        TriggerClientEvent('vrain_notify:showNotification', source, 'Sikeresen megtisztítottad a járművet!', 'success', 3000)
    end
end)


function GetSteamId64FromHex(hex_id)
	local len = string.len(hex_id)
	local dec = 0
	for i=1,len do
		local val = string.sub(hex_id, i, i)
		if val == "a" or val == "A" then val = 10*16^tonumber(len-i)
		elseif val == "b" or val == "B" then val = 11*16^tonumber(len-i)
		elseif val == "c" or val == "C" then val = 12*16^tonumber(len-i)
		elseif val == "d" or val == "D" then val = 13*16^tonumber(len-i)
		elseif val == "e" or val == "E" then val = 14*16^tonumber(len-i)
		elseif val == "f" or val == "F" then val = 15*16^tonumber(len-i)
		else val = tonumber(val)*16^tonumber(len-i)
		end
		dec = dec+math.ceil(val)
	end
	return dec
end