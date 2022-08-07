fx_version   "cerulean"
use_fxv2_oal "yes"
lua54        "yes"
game         "gta5"

dependency "iconreplace"

server_scripts {
    "@vCore/server/components/Table.lua",
    "@vCore/server/components/String.lua",
    "@vCore/server/components/Identifier.lua",
    "@mysql-async/lib/MySQL.lua",

    "server.lua", 
}

client_scripts {
    "client.lua"
}