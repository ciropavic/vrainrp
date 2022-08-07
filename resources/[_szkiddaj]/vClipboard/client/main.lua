function setClipboard(content)
    print('owo')
    SendNUIMessage({
        text = content
    });
end 
exports("set", setClipboard);

RegisterNetEvent("vClipboard::setClipboard");
AddEventHandler("vClipboard::setClipboard", function(content)
    setClipboard(content);
end);
