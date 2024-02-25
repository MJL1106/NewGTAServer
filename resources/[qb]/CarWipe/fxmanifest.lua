fx_version 'bodacious'
game 'gta5'

author 'LucaNL#2230'
description 'A script that allows you to run a carwipe every so often (hours/minutes), this will remove all cars that no one is in to prevent lag. This script does not cause any performance loss.'
version 'v1.1.1'

server_script {
    'config.lua',
    'server/server.lua',
    'version.lua'
}
client_scripts {
    'config.lua',
    'client/client.lua',
    'client/entityiter.lua'
}

