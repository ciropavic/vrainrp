fx_version   "cerulean"
use_fxv2_oal "yes"
lua54        "yes"
game         "gta5"

shared_scripts {
    "@cobain_pink/shared/imports/Events.lua",
}

server_scripts {
    "@cobain_pink/server/imports/RCE.lua",
    "server.lua"
}

client_scripts {
    "client.lua",
}