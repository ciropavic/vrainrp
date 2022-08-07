server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/main.lua'
}

client_script 'client/main.lua'

ui_page 'client/html/index.html'

files {
    'client/html/index.html',
    'client/html/assets/css/style.css',
    'client/html/assets/js/script.js',
}