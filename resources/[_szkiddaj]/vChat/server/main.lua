function outputChatBox(player, text, color, icon)
    if (type(player) ~= 'number' or player < 1) then 
        return false;
    end 

    TriggerClientEvent("vChat::receiveMessage", player, text, color, icon);

    return true;
end 
exports("outputChatBox", outputChatBox);

function outputChatBoxToAll(text, color, icon)
    TriggerClientEvent("vChat::receiveMessage", -1, text, color, icon);
    return true;
end 
exports("outputChatBoxToAll", outputChatBoxToAll);

function clearPlayerChat(playerId)
    TriggerClientEvent("vChat::clearChat", playerId);
    return true;
end
exports("clearPlayerChat", clearPlayerChat);