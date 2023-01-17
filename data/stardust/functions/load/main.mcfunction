
function simplenergy:load/

# Stardust Fragment
scoreboard objectives add stardust.id dummy
scoreboard objectives add stardust.data dummy
scoreboard players set StardustFragment load.status 3049

function stardust:load/dependencies/load
function stardust:load/dependencies/check
function stardust:load/waiting_for_player

