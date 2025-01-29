fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Lionh34rt#4305'
description 'Reworked bank robbery script for QBCore'
version '3.1'

dependencies {
    'PolyZone',
    'qb-target',
    'mka-lasers'
}

shared_script 'shared/sh_config.lua'

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@mka-lasers/client/client.lua',
    'client/cl_main.lua',
    'client/cl_doors.lua',
    'client/cl_laptops.lua',
    'client/cl_fleeca.lua',
    'client/cl_paleto.lua',
    'client/cl_pacific.lua',
    'client/cl_vault.lua'
}

server_scripts {
    'server/sv_main.lua',
    'server/sv_laptops.lua',
    'server/sv_vault.lua'
}
