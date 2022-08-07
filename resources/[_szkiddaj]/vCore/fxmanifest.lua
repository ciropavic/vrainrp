fx_version   'cerulean'
use_fxv2_oal 'yes'
lua54        'yes'
game         'gta5'

shared_scripts {
    "shared/entities.lua",
    "shared/cipher.lua",
    "shared/callback.lua",
    "shared/output.lua",

    "shared/enums/*.lua",
}

server_scripts {
    "server/main.lua",

    "server/callback.lua",

    "server/events/*.lua",

    "server/entity.lua",
    "server/entities/*.lua",
    
    "server/helpers/*.lua",

    "server/components.lua", 
    "server/components/*.lua",

    "server/output.lua",
}

client_scripts {
    "client/main.lua",
    
    "server/components.lua", 
    "server/components/*.lua",

    "client/callback.lua",

    "client/entity.lua",
    
    "client/entities/*.lua",
    "client/events/*.lua", 
    "client/helpers/*.lua"
}