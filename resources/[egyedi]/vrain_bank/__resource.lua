client_script('client/client.lua') --your NUI Lua File
server_script "@mysql-async/lib/MySQL.lua"
server_script 'server.lua'
ui_page('client/html/UI.html') --THIS IS IMPORTENT

--[[The following is for the files which are need for you UI (like, pictures, the HTML file, css and so on) ]]--
files {
	'client/html/UI.html',
    'client/html/style.css',
    'client/html/media/img/fingerprint.png',
    'client/html/media/img/fingerprint.jpg',
    'client/html/media/img/curve.gif',
    'client/html/media/img/logo-big.png',
    'client/html/media/img/logo-top.png'
}