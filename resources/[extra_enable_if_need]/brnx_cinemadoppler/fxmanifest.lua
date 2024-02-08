fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'BrunX Mods'
description 'BrunX Mods'
version '1.0.0'

this_is_a_map "yes"

data_file 'AUDIO_GAMEDATA' 'audio/brnx_cinema_col_game.dat151' -- dat151
data_file 'AUDIO_DYNAMIXDATA' 'audio/brnx_cinema_col_mix.dat15' -- dat15

files {
    "interiorproxies.meta",
	'audio/brnx_cinema_col_game.dat151.rel',
    'audio/brnx_cinema_col_mix.dat15.rel',
    'stream/*'
}

client_scripts {
    'cl_CinemaChairs.lua',
}

escrow_ignore {
    "config.lua",
	"gift.png",
    "stream/*.ytd",
}