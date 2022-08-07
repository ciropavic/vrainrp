fx_version   "cerulean"
use_fxv2_oal "yes"
lua54        "yes"
game         "gta5"

server_scripts {
    "@vCore/server/components/Table.lua",
    "@vCore/server/components/String.lua",
    "@vCore/server/components/Identifier.lua",

    -- Deps
    '@mysql-async/lib/MySQL.lua',

    -- Configs
    'config.lua',
    'server/config.lua',

    -- Script resources
    'server/main.lua',
    'server/modules/*.lua',

    -- Other shit
    'server/commands.lua',
}

ui_page 'client/html/index.html'

files {
	'client/html/**/*.*',
}

client_scripts {
    -- Configs
    'config.lua',
    'client/config.lua',

    -- Vendors
    'client/marker.lua',

    -- Script resources
    'client/main.lua',
    'client/modules/*.lua',
}