client_scripts {
    'config.lua',
    'client/marker.lua',
    'client/utils.lua',
    'client/client.lua',
    'client/shop.lua',
    'client/import.lua',
    'client/admin.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'config.lua',
    'server/server.lua',
    'server/admin.lua',
}

ui_page 'client/html/index.html'
files {
    'client/html/index.html',
    'client/html/assets/css/style.css',
    'client/html/assets/js/shop.js',
    'client/html/assets/js/dealer.js',
    'client/html/assets/js/app.js',
}

server_exports {
    'getVehicleList'
}