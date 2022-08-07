fx_version   'cerulean'
use_fxv2_oal 'yes'
lua54        'yes'
game         'gta5'

server_scripts {
    '@vCore/server/components/Table.lua',
    '@vCore/server/components/String.lua',
    '@vCore/server/components/Identifier.lua',
    '@oxmysql/lib/MySQL.lua',

    'server.lua',
}