fx_version 'cerulean'
game 'gta5'

author 'sensei'
version '1.4'

client_scripts {
    'client.lua',
    'tracker_client.lua',
    'cl_aidoc.lua',
    'cl_pocketbike.lua',
    'pdcarblacklistkick.lua',
    
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server.lua',
    'tracker_server.lua',
    'sv_aidoc.lua',
    'sv_pocketbike.lua',
    }

shared_script {
    'config.lua',
    'framework.lua',
} 
ui_page('html/index.html')

files({
    'html/index.html',
    'html/sounds/*.ogg',
})
