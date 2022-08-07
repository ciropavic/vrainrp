local __Channels = {
    player_ban = {
        url = "https://canary.discord.com/api/webhooks/titkosmikkentyu
        color = 16753920,
    },
    player_kick = {
        url = "https://canary.discord.com/api/webhooks/titkosmikkentyu
        color = 16753920,
    },

    vehicle = {
        url = "https://canary.discord.com/api/webhooks/titkosmikkentyu
        color = 16753920
    },
};

function logToDiscord(channel, data)
    if (
        type(channel) ~= "string" or 
        not __Channels[channel]
    ) then 
    end 

    local webhook = __Channels[channel];

    local hookData = {
        username = (data?.username or "Ismeretlen admin"), 
        embeds = data?.embed, 
        content = data?.content
    };

    PerformHttpRequest(
        webhook.url, 
        function(...)
            print(...)
        end, 
        "POST", 
        json.encode(hookData), 
        {
            ["Content-Type"] = "application/json"
        }
    );
end 