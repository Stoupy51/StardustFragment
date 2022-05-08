
tag @s add stardust.shooter
#Nbt manipulation for death messages
	data modify storage stardust:main Sniper set from storage stardust:main SelectedItemTag
	function stardust:right_click/snipers/decode_lore

#Check what Sniper is it and set Base Damage
	scoreboard players set #sniper_type stardust.data 0
	execute if score #sniper_type stardust.data matches 0 store result score #sniper_type stardust.data if data storage stardust:main SelectedItemTag.stardust.stardust_sniper run summon area_effect_cloud ~ ~ ~ {Tags:[stardust.to_throw,stardust.bullet,stardust.shooter,stardust.stardust_sniper],Age:0,Duration:0,Radius:0f}
	execute if score #sniper_type stardust.data matches 1 run scoreboard players set #sniper_type stardust.data -1
	execute if score #sniper_type stardust.data matches 0 store result score #sniper_type stardust.data if data storage stardust:main SelectedItemTag.stardust.awakened_stardust_sniper run summon area_effect_cloud ~ ~ ~ {Tags:[stardust.to_throw,stardust.bullet,stardust.shooter,stardust.awakened_stardust_sniper],Age:0,Duration:0,Radius:0f}
	execute if score #sniper_type stardust.data matches 1 run scoreboard players set #sniper_type stardust.data -2
	execute if score #sniper_type stardust.data matches 0 store result score #sniper_type stardust.data if data storage stardust:main SelectedItemTag.stardust.ultimate_sniper run summon area_effect_cloud ~ ~ ~ {Tags:[stardust.to_throw,stardust.bullet,stardust.shooter,stardust.ultimate_sniper],Age:0,Duration:0,Radius:0f}
	execute if score #sniper_type stardust.data matches 1 run scoreboard players set #sniper_type stardust.data -3

	execute if score #sniper_type stardust.data matches -1 run scoreboard players set #bullet_damage stardust.data 5
	execute if score #sniper_type stardust.data matches -2 run scoreboard players set #bullet_damage stardust.data 50
	execute if score #sniper_type stardust.data matches -3 run scoreboard players set #bullet_damage stardust.data 130

#Check bullet, add damage and clear one
	execute if entity @s[nbt={Inventory:[{id:"minecraft:iron_nugget"}]}] run scoreboard players set #bullet_type stardust.data 1
	execute if entity @s[nbt={Inventory:[{id:"minecraft:gold_nugget"}]}] run scoreboard players set #bullet_type stardust.data 2
	execute if entity @s[nbt={Inventory:[{tag:{stardust:{stardust_fragment:1b}}}]}] run scoreboard players set #bullet_type stardust.data 3
	execute if entity @s[nbt={Inventory:[{tag:{stardust:{awakened_stardust:1b}}}]}] run scoreboard players set #bullet_type stardust.data 4
	execute if entity @s[nbt={Inventory:[{tag:{stardust:{ultimate_bullet:1b}}}]}] run scoreboard players set #bullet_type stardust.data 5
	execute if score #bullet_type stardust.data matches 1 run scoreboard players add #bullet_damage stardust.data 5
	execute if score #bullet_type stardust.data matches 1 run clear @s minecraft:iron_nugget 1
	execute if score #bullet_type stardust.data matches 2 run scoreboard players add #bullet_damage stardust.data 10
	execute if score #bullet_type stardust.data matches 2 run clear @s minecraft:gold_nugget 1
	execute if score #bullet_type stardust.data matches 3 run scoreboard players add #bullet_damage stardust.data 15
	execute if score #bullet_type stardust.data matches 3 run clear @s minecraft:command_block{stardust:{stardust_fragment:1b}} 1
	execute if score #bullet_type stardust.data matches 4 run scoreboard players add #bullet_damage stardust.data 20
	execute if score #bullet_type stardust.data matches 4 run clear @s minecraft:command_block{stardust:{awakened_stardust:1b}} 1
	execute if score #bullet_type stardust.data matches 5 run scoreboard players add #bullet_damage stardust.data 2048
	execute if score #bullet_type stardust.data matches 5 run clear @s minecraft:command_block{stardust:{ultimate_bullet:1b}} 1

#Launch the bullet
	execute if entity @s[gamemode=creative] unless score #bullet_type stardust.data matches 1.. run scoreboard players set #bullet_type stardust.data 1
	tp @e[type=area_effect_cloud,tag=stardust.to_throw,limit=1] @s
	execute as @e[type=area_effect_cloud,tag=stardust.to_throw,limit=1] run tp @s ^ ^1.55 ^
	execute if predicate stardust:sneaking as @e[type=area_effect_cloud,tag=stardust.to_throw,limit=1] at @s run tp @s ~ ~-0.3 ~
	execute unless score #bullet_type stardust.data matches 1.. run playsound block.note_block.snare ambient @s ~ ~ ~ 1 0.5
	execute if score #bullet_type stardust.data matches 1.. if score #sniper_type stardust.data matches -1 run playsound stardust:sniper_shot_1 ambient @a[distance=..20] ~ ~ ~ 0.5
	execute if score #bullet_type stardust.data matches 1.. if score #sniper_type stardust.data matches -2 run playsound stardust:sniper_shot_2 ambient @a[distance=..20] ~ ~ ~ 0.5
	execute if score #bullet_type stardust.data matches 1.. if score #sniper_type stardust.data matches -3 run playsound stardust:sniper_shot_3 ambient @a[distance=..20] ~ ~ ~ 0.5
	execute if score #bullet_type stardust.data matches 1.. as @e[type=area_effect_cloud,tag=stardust.to_throw,limit=1] at @s run function stardust:right_click/snipers/projectile_move

tag @s remove stardust.shooter
tag @e[tag=stardust.shooted] remove stardust.shooted
scoreboard players set @s stardust.cooldown 30
scoreboard players reset #bullet_type stardust.data
scoreboard players reset #bullet_damage stardust.data
data remove storage stardust:main Sniper

