server_scripts {
    '@mysql-async/lib/MySQL.lua',

    'configs/shared.lua',
    'configs/server.lua',

    'server/main.lua',
    'server/admin.lua',
    'server/customer.lua',
    'server/manager.lua',
}

ui_page 'client/html/index.html'

client_scripts {
    'configs/shared.lua',
    'configs/client.lua',

    'client/marker.lua',
    'client/utils.lua',
    'client/main.lua',

    'client/customer.lua',
    'client/manager.lua',
}

files {
    'client/html/index.html',
    'client/html/assets/css/style.css',
    'client/html/assets/js/*.js',
}