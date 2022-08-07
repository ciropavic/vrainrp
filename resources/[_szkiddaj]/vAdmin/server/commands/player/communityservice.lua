local __CommunityServiceSessions = {};

Command(
    "commserv", 
    {
        description = "Közmunkára tétele.",
        required = { admin = 2, off_admin = 2 },
        args = {
            { type = "player" },
            { type = "number", name = "Mennyiség", min = 1, max = 1000 },
            { type = "text", name = "Indok" }
        }
    }, 
    function(player, targetPlayer, amount, reason)
        local identifier = (GetPlayerIdentifiers(targetPlayer) or {})[MainIdentifier];

        if (__CommunityServiceSessions[identifier]) then 
            return exports.vChat:outputChatBox(player, getPlayerName(targetPlayer) .. " már közmunkán van.");
        end 

        -- __CommunityServiceSessions[identifier] = {
        --     admin = getPlayerAdminName(player), 
        --     time = os.time(), 
        --     total = amount, 
        --     left = amount
        -- };
    end
);

