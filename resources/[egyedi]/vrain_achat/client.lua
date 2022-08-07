RegisterNetEvent("notification:send")
AddEventHandler("notification:send", function(text)
	ShowNotification(text)
end)

function ShowNotification( text )
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringPlayerName(text)
    DrawNotification(false, false)
end