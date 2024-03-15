fx_version 'cerulean'
game 'gta5'

description 'nk_callsigns'
version '1.0.1'

ui_page 'html/dist/index.html'

files {
  'html/dist/index.html',
  'html/dist/assets/*'
}

client_scripts {
  'config.lua',
  'bridge/esx.lua',
  'bridge/qbcore.lua',
  'main.lua'
}

lua54 'yes'

escrow_ignore {
  'config.lua',
  'bridge/esx.lua',
  'bridge/qbcore.lua',
  'main.lua'
}

dependency '/assetpacks'