
#> stardust:advancements/on_respawn
#
# @executed	as the player & at current position
#
# @within	advancement stardust:technical/on_respawn
#

# Revoke advancement
advancement revoke @s only stardust:technical/on_respawn

# Stop if not respawned
execute store result score #health stardust.data run data get entity @s Health 100.0
execute if score #health stardust.data matches ..0 run return fail

# Reset death count
scoreboard players set @s stardust.death 0

# Update max health on respawn
function stardust:utils/update_max_health

