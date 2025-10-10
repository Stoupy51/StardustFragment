
#> stardust:custom_blocks/darkium_seed/place_main
#
# @executed	as @e[type=item_frame,tag=...] & at @s
#
# @within	stardust:custom_blocks/darkium_seed/place_check
#

# Get the facing direction of the item frame
scoreboard players set #item_frame_facing stardust.data 1
execute if entity @s[type=item_frame] run function stardust:custom_blocks/darkium_seed/get_facing

# Summon the new item frame (not execute summon because it would not be invisible for a tick)
summon item_frame ~ ~ ~ {Tags:["stardust.new"],Invulnerable:false,Invisible:true,Fixed:false,Silent:true}
execute as @n[tag=stardust.new] at @s run function stardust:custom_blocks/darkium_seed/place_secondary

# Increment count scores
scoreboard players add #total_custom_blocks stardust.data 1
scoreboard players add #total_vanilla_item_frame stardust.data 1
scoreboard players add #total_darkium_seed stardust.data 1

# Replace the placing sound
playsound minecraft:block.stone.place block @a[distance=..5]

