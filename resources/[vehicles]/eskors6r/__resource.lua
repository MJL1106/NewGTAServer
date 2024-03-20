resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'
description "5M Garage discord.gg/5mGarage"
 
files {
    'vehicles.meta',
    'carvariations.meta',
    'carcols.meta',
    'handling.meta',
    'audioconfig/*.dat151.rel',
    'audioconfig/*.dat54.rel',
    --'audioconfig/*.dat10.rel',
    'sfx/**/*.awc'
}

data_file 'HANDLING_FILE' 'handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'vehicles.meta'
data_file 'CARCOLS_FILE' 'carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'carvariations.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'vehiclelayouts.meta'
--data_file 'AUDIO_SYNTHDATA' 'audioconfig/audiea855_amp.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/audiea855_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/audiea855_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_audiea855'