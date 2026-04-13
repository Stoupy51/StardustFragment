
#> stardust:utils/snipers/raycast_in_your_ass
#
# @executed	as the player & at current position
#
# @within	stardust:utils/snipers/right_click with storage stardust:temp sniper_data
#
# @args		playsound (unknown)
#			damage (unknown)
#

# Playsound
$playsound $(playsound) player @a[distance=..64] ~ ~ ~ 0.5 1

# Add base damage
$scoreboard players add #bullet_damage stardust.data $(damage)
data modify storage stardust:temp input set value {"target":"@s","amount":1.0d,"source":"@p[tag=stardust.shooter]"}
execute store result storage stardust:temp input.amount double 1.0 run scoreboard players get #bullet_damage stardust.data

# Prepare arguments
data modify storage stardust:temp raycast set value {with:{}}
data modify storage stardust:temp raycast.with.blocks set value true
data modify storage stardust:temp raycast.with.entities set value true
data modify storage stardust:temp raycast.with.piercing set value 10
data modify storage stardust:temp raycast.with.max_distance set value 128
data modify storage stardust:temp raycast.with.on_targeted_block set value "function stardust:utils/snipers/on_targeted_block"
data modify storage stardust:temp raycast.with.on_targeted_entity set value "function stardust:utils/snipers/on_targeted_entity"

# Launch raycast with callbacks (https://docs.mcbookshelf.dev/en/latest/modules/raycast.html#run-the-raycast)
execute anchored eyes positioned ^ ^ ^0.5 run function #bs.raycast:run with storage stardust:temp raycast

