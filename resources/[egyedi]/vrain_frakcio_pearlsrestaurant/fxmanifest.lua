fx_version 'adamant'

game 'gta5'

description 'ESX Door Lock'

version '1.4.0'


server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/en.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'config.lua',
	'client/main.lua'
}

dependencies {
	'es_extended'
}





server_scripts { '@mysql-async/lib/MySQL.lua' }