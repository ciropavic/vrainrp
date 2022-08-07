fx_version   "cerulean"
use_fxv2_oal "yes"
lua54        "yes"
game         "gta5"

shared_scripts {
    "@es_extended/imports.lua",
    "shared/main.lua"
}

server_scripts {
    "@cobain_pink/server/imports/RCE.lua",

    "@vCore/server/components/Table.lua",
    "@vCore/server/components/String.lua",
    "@vCore/server/components/Identifier.lua",
    "@oxmysql/lib/MySQL.lua",
    
    "server/utils.lua", 
    
    "server/main.lua", 

    "server/logs.lua", 

    "server/commands.lua", 

    "server/systems/**/*.lua",
    "server/commands/**/*.lua",
}

client_scripts {
    "client/*.lua"
}