fx_version 'cerulean'
game 'gta5'

description 'QB-Diving'
version '1.2.0'

shared_script {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua'
}

server_scripts {
    'server/main.lua',
    'server/sv_diving.lua',
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    'client/main.lua',
    'client/cl_diving.lua',
}

lua54 'yes'
