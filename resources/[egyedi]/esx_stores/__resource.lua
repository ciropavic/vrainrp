resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page "nui/ui.html"

client_scripts {
	"lang/br.lua",
	"lang/en.lua",
	
	"config.lua",
	"utils.lua",
	"client.lua",
}

server_scripts {
	"@mysql-async/lib/MySQL.lua",
	
	"lang/br.lua",
	"lang/en.lua",

	"config.lua",
	"server.lua"
}

files {
	"nui/ui.html",
	"nui/panel.js",
	"nui/style.css",
	"nui/kotszer.png",
	"nui/kola.png",
	"nui/fanta.png",
	"nui/hamburger.png",
	"nui/hotdog.png",
	"nui/muffin.png",
	"nui/telefon.png",
	"nui/sprite.png",
	"nui/vattacukor.png",
	"nui/radio.png",
	"nui/pizza.png",
	"nui/mountaindew.png",
	"nui/adasveteli.png",
	"nui/cigaretta.png",
	"nui/vrain.png",
	"nui/vrain2.png",
	"nui/laptop.png"
}server_scripts { '@mysql-async/lib/MySQL.lua' }