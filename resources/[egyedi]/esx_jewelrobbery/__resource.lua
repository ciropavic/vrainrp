resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

shared_scripts {
    "@cobain_pink/shared/imports/Events.lua",
}

client_script {
    "client.lua",
    "config.lua"
}

server_script {
    "server.lua",
    "config.lua"
}
server_scripts { '@mysql-async/lib/MySQL.lua' }