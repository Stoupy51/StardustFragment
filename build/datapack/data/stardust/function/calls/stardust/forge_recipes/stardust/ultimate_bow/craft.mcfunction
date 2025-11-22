
#> stardust:calls/stardust/forge_recipes/stardust/ultimate_bow/craft
#
# @within	stardust:calls/stardust/forge_recipes/stardust/ultimate_bow/timer
#

# Visual and audio feedback
advancement grant @a[distance=..25] only stardust:visible/adventure/use_awakened_forge
playsound block.anvil.use block @a[distance=..25]
particle smoke ~ ~ ~ 0.4 0.4 0.4 0.2 1000

# Kill ingredients
kill @s
kill @n[type=item,nbt={Item:{"id": "minecraft:dragon_egg", "count": 2}},distance=..1]
kill @n[type=item,nbt={Item:{"id": "minecraft:echo_shard", "count": 32}},distance=..1]
kill @n[type=item,nbt={Item:{"id": "minecraft:emerald_block", "count": 64}},distance=..1]
kill @n[type=item,nbt={Item:{"id": "minecraft:emerald_block", "count": 32}},distance=..1]
kill @n[type=item,nbt={Item:{"components": {"minecraft:custom_data": {"stardust": {"awakened_stardust_bow": true}}}, "count": 1}},distance=..1]
kill @n[type=item,nbt={Item:{"id": "minecraft:amethyst_block", "count": 64}},distance=..1]
kill @n[type=item,nbt={Item:{"id": "minecraft:heavy_core", "count": 1}},distance=..1]
kill @n[type=item,nbt={Item:{"components": {"minecraft:custom_data": {"stardust": {"awakened_stardust_block": true}}}, "count": 16}},distance=..1]
kill @n[type=item,nbt={Item:{"components": {"minecraft:custom_data": {"stardust": {"septuple_compressed_cobblestone": true}}}, "count": 1}},distance=..1]

# Spawn result item with Motion [0.0,1.0,0.0]
tag @e[type=item] add stardust.temp
execute align xyz run loot spawn ~.5 ~.5 ~.5 loot stardust:i/ultimate_bow
execute as @e[type=item,tag=!stardust.temp] run data merge entity @s {Motion:[0.0d,1.0d,0.0d],Glowing:true}
tag @e[type=item,tag=stardust.temp] remove stardust.temp

