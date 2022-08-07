Config = {};

-- Nem nyulsz hozza mert eltorom a kezed
Config.identities = {
    license = true,
    steam = true,
    live = true, 
    xbl = true, 
    discord = true,
    ip = true
};

Config.labels = {
    ['got_banned'] = 'Bannolva lettél a szerverről %s által a következő indokkal: %s',
    ['no_steam'] = 'nincs stem',
    ['check_is_banned'] = 'Megnezem h banolva v-e xd',

    ['already_banned'] = [[


        Bannolva lettél %s által!
        Indok: %s
        Időtartam: %s
        Azonosító: #%s
    ]],
};

string.split = function (inputstr, sep)
    local sep = (sep or ',');
    local t = {};

    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str);
    end

    return t;
end

function getTime()
    return os.time() * 1000;
end 