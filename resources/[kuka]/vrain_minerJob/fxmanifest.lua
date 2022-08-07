fx_version 'adamant'

game 'gta5'

description 'RC-MinerJob'

shared_scripts {
    "@cobain_pink/shared/imports/Events.lua",
}

server_scripts {
	'server/main.lua',
	'config.lua',
	"@oxmysql/lib/MySQL.lua"
}

client_scripts {
	'config.lua',
	'client/main.lua'
}

ui_page "html/index.html"

files {
    'html/index.html',
    'html/index.js',
    'html/index.css',
    'html/pickaxe.png',
    'html/bread.png',
    'html/water.png',
    'html/logo.png'
}

server_scripts { '@mysql-async/lib/MySQL.lua' }