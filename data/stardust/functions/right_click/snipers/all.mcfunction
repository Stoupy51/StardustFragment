
#> stardust:right_click/snipers/all
#
# @within			stardust:right_click/all
# @executed			as & at current player
#
# @description		Manage shooting with all snipers
#

# Add temporary tag to the shooter (to prevent shooting himself and keep track of him)
tag @s add stardust.shooter

# Check what Sniper is it and summon bullet (marker)
scoreboard players set #sniper_type stardust.data 0
execute if score #sniper_type stardust.data matches 0 store success score #sniper_type stardust.data if data storage stardust:main SIT.stardust.stardust_sniper run summon marker ~ ~ ~ {Tags:["stardust.to_throw","stardust.bullet","stardust.shooter","stardust.stardust_sniper"]}
execute if score #sniper_type stardust.data matches 1 run scoreboard players set #sniper_type stardust.data -1
execute if score #sniper_type stardust.data matches 0 store success score #sniper_type stardust.data if data storage stardust:main SIT.stardust.awakened_stardust_sniper run summon marker ~ ~ ~ {Tags:["stardust.to_throw","stardust.bullet","stardust.shooter","stardust.awakened_stardust_sniper"]}
execute if score #sniper_type stardust.data matches 1 run scoreboard players set #sniper_type stardust.data -2
execute if score #sniper_type stardust.data matches 0 store success score #sniper_type stardust.data if data storage stardust:main SIT.stardust.ultimate_sniper run summon marker ~ ~ ~ {Tags:["stardust.to_throw","stardust.bullet","stardust.shooter","stardust.ultimate_sniper"]}
execute if score #sniper_type stardust.data matches 1 run scoreboard players set #sniper_type stardust.data -3

# Set Base Damage
execute if score #sniper_type stardust.data matches -1 run scoreboard players set #bullet_damage stardust.data 6
execute if score #sniper_type stardust.data matches -2 run scoreboard players set #bullet_damage stardust.data 12
execute if score #sniper_type stardust.data matches -3 run scoreboard players set #bullet_damage stardust.data 24

# Check bullet, add damage and clear one
execute if entity @s[nbt={Inventory:[{tag:{stardust:{ultimate_bullet:1b}}}]}] run scoreboard players set #bullet_type stardust.data 5
execute if entity @s[nbt={Inventory:[{tag:{stardust:{awakened_stardust:1b}}}]}] run scoreboard players set #bullet_type stardust.data 4
execute if entity @s[nbt={Inventory:[{tag:{stardust:{stardust_fragment:1b}}}]}] run scoreboard players set #bullet_type stardust.data 3
execute if entity @s[nbt={Inventory:[{id:"minecraft:gold_nugget"}]}] run scoreboard players set #bullet_type stardust.data 2
execute if entity @s[nbt={Inventory:[{id:"minecraft:iron_nugget"}]}] run scoreboard players set #bullet_type stardust.data 1
execute if score #bullet_type stardust.data matches 1 run scoreboard players add #bullet_damage stardust.data 5
execute if score #bullet_type stardust.data matches 1 run advancement grant @s only stardust:visible/adventure/shoot/copper_nugget
execute if score #bullet_type stardust.data matches 1 run clear @s iron_nugget 1
execute if score #bullet_type stardust.data matches 2 run scoreboard players add #bullet_damage stardust.data 10
execute if score #bullet_type stardust.data matches 2 run advancement grant @s only stardust:visible/adventure/shoot/iron_nugget
execute if score #bullet_type stardust.data matches 2 run clear @s gold_nugget 1
execute if score #bullet_type stardust.data matches 3 run scoreboard players add #bullet_damage stardust.data 15
execute if score #bullet_type stardust.data matches 3 run advancement grant @s only stardust:visible/adventure/shoot/gold_nugget
execute if score #bullet_type stardust.data matches 3 run clear @s #stardust:items{stardust:{stardust_fragment:1b}} 1
execute if score #bullet_type stardust.data matches 4 run scoreboard players add #bullet_damage stardust.data 20
execute if score #bullet_type stardust.data matches 4 run advancement grant @s only stardust:visible/adventure/shoot/stardust_essence
execute if score #bullet_type stardust.data matches 4 run clear @s #stardust:items{stardust:{awakened_stardust:1b}} 1
execute if score #bullet_type stardust.data matches 5 run scoreboard players add #bullet_damage stardust.data 50
execute if score #bullet_type stardust.data matches 5 run advancement grant @s only stardust:visible/adventure/shoot/awakened_stardust
execute if score #bullet_type stardust.data matches 5 run clear @s #stardust:items{stardust:{ultimate_bullet:1b}} 1

## Launch the bullet
# If no bullet found and player is in creative, set bullet to iron_nugget
execute if entity @s[gamemode=creative] unless score #bullet_type stardust.data matches 1.. run scoreboard players set #bullet_type stardust.data 1

# Teleport the bullet marker to the player head (Not one command because we need rotation)
tp @e[type=marker,tag=stardust.to_throw,limit=1] @s
execute as @e[type=marker,tag=stardust.to_throw,limit=1] run tp @s ^ ^1.55 ^.5
execute if predicate stardust:sneaking as @e[type=marker,tag=stardust.to_throw,limit=1] at @s run tp @s ~ ~-0.3 ~

# Playsounds depending on sniper type and if bullet is found
execute unless score #bullet_type stardust.data matches 1.. run playsound block.note_block.snare ambient @s ~ ~ ~ 1 0.5
execute if score #bullet_type stardust.data matches 1.. if score #sniper_type stardust.data matches -1 run playsound stardust:sniper_shot_1 ambient @a[distance=..20] ~ ~ ~ 0.5
execute if score #bullet_type stardust.data matches 1.. if score #sniper_type stardust.data matches -2 run playsound stardust:sniper_shot_2 ambient @a[distance=..20] ~ ~ ~ 0.5
execute if score #bullet_type stardust.data matches 1.. if score #sniper_type stardust.data matches -3 run playsound stardust:sniper_shot_3 ambient @a[distance=..20] ~ ~ ~ 0.5

# Launch the bullet
execute if score #bullet_type stardust.data matches 1.. as @e[type=marker,tag=stardust.to_throw,limit=1] at @s run function stardust:right_click/snipers/projectile_move

# Remove temporary tags, set cooldown and clear data
tag @s remove stardust.shooter
tag @e[tag=stardust.shooted] remove stardust.shooted
scoreboard players set @s stardust.cooldown 30
scoreboard players reset #bullet_type stardust.data
scoreboard players reset #bullet_damage stardust.data

