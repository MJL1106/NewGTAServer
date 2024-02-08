fx_version 'cerulean'
game 'gta5'

description 'OSM-Carvalet'
version '1.0.0'

shared_scripts { 
    '@qb-garages/config.lua',
	'config.lua'
}

server_scripts {
    'server/main.lua',
    '@oxmysql/lib/MySQL.lua',
}

client_script 'client/main.lua'

ui_page "html/index.html"

files {
    'html/index.html',
    'html/index.js',
    'html/index.css',
    'html/reset.css'
}
