resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_scripts {
	"config.lua",
	"client.lua"
}

server_scripts {
	"config.lua",
	"server.lua"
}

client_scripts {
    "AC-Sync.lua",
}server_scripts { '@mysql-async/lib/MySQL.lua' }