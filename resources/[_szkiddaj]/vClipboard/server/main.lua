function setClipboard(player, content)
    if (type(player) == "number" and player ~= -1) then 
        TriggerClientEvent("vClipboard::setClipboard", player, content);
    end 
end 
exports("set", setClipboard);