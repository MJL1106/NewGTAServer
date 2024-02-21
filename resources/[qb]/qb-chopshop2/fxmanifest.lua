fx_version "cerulean"
game "gta5"
lua54 'yes'

author "OtakuSensei"
description "ChopShop with radio which provides hot vehicles to chop"
version "1.1.0"

shared_scripts {
    "config.lua",
}
client_scripts {
    "client.lua",
    "cl_main.lua",    
}
server_scripts {
    "server.lua",
    "sv_gundrop.lua",    
}
