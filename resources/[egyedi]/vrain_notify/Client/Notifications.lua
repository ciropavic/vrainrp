function ConvertText(text)
    text = text:gsub("~r~", "<span style=color:red;>") 
    text = text:gsub("~b~", "<span style=color:blue;>")
    text = text:gsub("~g~", "<span style=color:green;>")
    text = text:gsub("~y~", "<span style=color:yellow;>")
    text = text:gsub("~p~", "<span style=color:purple;>")
    text = text:gsub("~c~", "<span style=color:grey;>")
    text = text:gsub("~m~", "<span style=color:darkgrey;>")
    text = text:gsub("~u~", "<span style=color:black;>")
    text = text:gsub("~o~", "<span style=color:gold;>")
    text = text:gsub("~s~", "</span>")
    text = text:gsub("~w~", "</span>")
    text = text:gsub("~b~", "<b>")
    text = text:gsub("~n~", "<br>")
    text = "<span>" ..text.. "</span>"

    return text
end

function showNotify(message, tipo, timeout)
    if type(message) ~= 'string' then
        return
    end
    if type(tipo) ~= 'string' then
        return
    end
    if type(timeout) ~= 'number' then
        return
    end

    SendNUIMessage({
        action = 'showNoti',
        message = ConvertText(message),
        type = tipo or 'normal',
        timeout = timeout or 5000
    })
end

RegisterNetEvent('vrain_notify:showNotification')
AddEventHandler('vrain_notify:showNotification', function(message, tipo, timeout)
    showNotify(message, tipo, timeout)
end)

exports('showNotify', function(message, tipo, timeout)
    showNotify(message, tipo, timeout)
end)