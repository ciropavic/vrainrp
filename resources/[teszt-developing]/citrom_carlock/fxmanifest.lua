version '1.0.0'
author 'Citrom10'
description 'Car - Faction Car Lock'

fx_version 'adamant'
game 'gta5'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server.lua',
    'config.lua',
}
client_scripts {
    'client.lua',
    'config.lua',
}