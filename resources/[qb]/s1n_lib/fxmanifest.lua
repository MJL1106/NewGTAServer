author 'S1nScripts'
version '1.7.0'
repository 'https://github.com/S1nScripts/s1n_lib'

fx_version 'cerulean'
game 'gta5'

use_experimental_fxv2_oal 'yes'
lua54 'yes'

dependencies {
    '/server:5848',
    '/onesync',
    'oxmysql'
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "src/modules/**/server/*.lua",
    --"tests/modules/**/server/*.lua",
    "src/init.lua",
}

shared_scripts {
    "configuration/shared/*.lua",
    "src/modules/**/shared/*.lua",
    --"tests/modules/**/shared/*.lua",
}

client_scripts {
    "src/modules/**/client/*.lua",
    --"tests/modules/**/client/*.lua",
}

escrow_ignore {
"configuration/**/*"
}

dependency '/assetpacks'