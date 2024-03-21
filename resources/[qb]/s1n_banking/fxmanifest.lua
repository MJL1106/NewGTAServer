fx_version "cerulean"

description "S1nScripts Bank System"
author "S1nScripts"
version '1.7.2'

lua54 'yes'

game 'gta5'

shared_scripts {
    'shared/*'
}

client_scripts {
    'languages/english.lua',
    'client/handlers/*',
    'client/modules/*',
    'client/main.lua',
}

server_scripts {
    'languages/english.lua',
    'server/config.lua',
    'server/init.lua',
    'server/handlers/*',
    'server/modules/*',
    'server/sql.lua'
}

ui_page 'web/index.html'

files {
    'web/*',
    'web/img/*',
    'web/font/*'
}

dependencies {
    '/onesync',
    's1n_lib'
}

escrow_ignore {
"languages/**.lua","shared/config.lua","server/config.lua","server/modules/commands.lua"
}

dependency '/assetpacks'