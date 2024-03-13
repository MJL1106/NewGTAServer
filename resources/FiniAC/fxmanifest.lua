shared_scripts {'fini_events.js', 'fini_events.lua'}
shared_scripts {'fini_entities.js', 'fini_entities.lua'}

fx_version "cerulean"
game "gta5"

ui_page 'anticheat.html'
files {'anticheat.html'}

client_scripts {'client/client.js'}
server_scripts {'server/server.js', 'anticheat_init.lua'}

lua54 'yes'
