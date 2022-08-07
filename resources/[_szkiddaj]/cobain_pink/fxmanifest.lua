fx_version 'adamant'
game 'gta5'
description 'cobain_pink anticheat'
version '9/11'

shared_scripts {
    'shared/config.lua',
    'shared/encode.lua',
}

server_scripts {
    'server/config.lua',
    'server/main.lua',

    'server/heartbeat.lua', 
    
    'server/modules/*.lua', 
}

client_scripts {
    'client/config.lua',
    'client/main.lua',

    'client/heartbeat.lua',

    'client/modules/*.lua',
}

files {
    "shared/imports/Events.lua",
}