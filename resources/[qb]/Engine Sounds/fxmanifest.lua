fx_version 'cerulean'
game { 'gta5' }
lua54 'yes'

author 'KCMIR0 Commissioned By Rocky'
description '1990s-2000s - 7.3 Powerstroke IDI | KCMIR0 discord.com/invite/YexPqFvaV9'
version '1.0.0'

files {
	"audioconfig/*.dat151.rel",
	"audioconfig/*.dat54.rel",
	"audioconfig/*.dat10.rel",
	"sfx/**/*.awc"
}

data_file "AUDIO_SYNTHDATA" "audioconfig/kc64ford73idi_amp.dat"
data_file "AUDIO_GAMEDATA" "audioconfig/kc64ford73idi_game.dat"
data_file "AUDIO_SOUNDDATA" "audioconfig/kc64ford73idi_sounds.dat"
data_file "AUDIO_WAVEPACK" "sfx/dlc_kc64ford73idi"
dependency '/assetpacks'