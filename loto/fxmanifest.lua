fx_version 'cerulean'
game 'gta5'
lua54 'yes'

description 'generator with item can create ticket for loto'
author 'vshown'
version '1.0'


ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/main.js'
}

--import script
shared_script '@es_extended/imports.lua'

client_script 'main.lua'
server_script 'server.lua'