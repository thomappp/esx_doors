fx_version 'bodacious'
game 'gta5'

author 'Thomapp'
description 'Script for locking and unlocking doors.'

shared_scripts { '@es_extended/imports.lua', 'config.lua' }
client_script 'cl_door.lua'
server_script 'sv_door.lua'

dependency 'es_extended'