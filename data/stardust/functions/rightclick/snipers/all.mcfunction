tag @s add StardustFragment_Shooter

#Check what Sniper is it and set Base Damage
	execute if entity @s[nbt={SelectedItem:{tag:{StardustFragment_StardustSniper:1b}}}] run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:[StardustFragment_ToThrow,StardustFragment_Bullet,StardustFragment_StardustSniper],Age:0,Duration:0,Radius:0f}
	execute if entity @s[nbt={SelectedItem:{tag:{StardustFragment_AwakenedStardustSniper:1b}}}] run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:[StardustFragment_ToThrow,StardustFragment_Bullet,StardustFragment_AwakenedStardustSniper],Age:0,Duration:0,Radius:0f}
	execute if entity @s[nbt={SelectedItem:{tag:{StardustFragment_UltimateSniper:1b}}}] run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:[StardustFragment_ToThrow,StardustFragment_Bullet,StardustFragment_UltimateSniper],Age:0,Duration:0,Radius:0f}

	execute if entity @e[type=area_effect_cloud,tag=StardustFragment_StardustSniper,limit=1] run scoreboard players set BulletDamage StardustFragment_Data 5
	execute if entity @e[type=area_effect_cloud,tag=StardustFragment_AwakenedStardustSniper,limit=1] run scoreboard players set BulletDamage StardustFragment_Data 50
	execute if entity @e[type=area_effect_cloud,tag=StardustFragment_UltimateSniper,limit=1] run scoreboard players set BulletDamage StardustFragment_Data 130

#Check bullet and add damage
	execute if entity @s[nbt={Inventory:[{id:"minecraft:iron_nugget"}]}] run scoreboard players set Bullet StardustFragment_Data 1
	execute if entity @s[nbt={Inventory:[{id:"minecraft:gold_nugget"}]}] run scoreboard players set Bullet StardustFragment_Data 2
	execute if entity @s[nbt={Inventory:[{tag:{StardustFragment_StardustFragment:1b}}]}] run scoreboard players set Bullet StardustFragment_Data 3
	execute if entity @s[nbt={Inventory:[{tag:{StardustFragment_AwakenedStardust:1b}}]}] run scoreboard players set Bullet StardustFragment_Data 4
	execute if entity @s[nbt={Inventory:[{tag:{StardustFragment_UltimateBullet:1b}}]}] run scoreboard players set Bullet StardustFragment_Data 5
	execute if score Bullet StardustFragment_Data matches 1 run scoreboard players add BulletDamage StardustFragment_Data 5
	execute if score Bullet StardustFragment_Data matches 1 run clear @s minecraft:iron_nugget 1
	execute if score Bullet StardustFragment_Data matches 2 run scoreboard players add BulletDamage StardustFragment_Data 10
	execute if score Bullet StardustFragment_Data matches 2 run clear @s minecraft:gold_nugget 1
	execute if score Bullet StardustFragment_Data matches 3 run scoreboard players add BulletDamage StardustFragment_Data 15
	execute if score Bullet StardustFragment_Data matches 3 run clear @s minecraft:command_block{StardustFragment_StardustFragment:1b} 1
	execute if score Bullet StardustFragment_Data matches 4 run scoreboard players add BulletDamage StardustFragment_Data 20
	execute if score Bullet StardustFragment_Data matches 4 run clear @s minecraft:command_block{StardustFragment_AwakenedStardust:1b} 1
	execute if score Bullet StardustFragment_Data matches 5 run scoreboard players add BulletDamage StardustFragment_Data 2048
	execute if score Bullet StardustFragment_Data matches 5 run clear @s minecraft:command_block{StardustFragment_UltimateBullet:1b} 1

execute if entity @s[gamemode=creative] unless score Bullet StardustFragment_Data matches 1.. run scoreboard players set Bullet StardustFragment_Data 1
tp @e[type=area_effect_cloud,tag=StardustFragment_ToThrow,limit=1] @s
execute as @e[type=area_effect_cloud,tag=StardustFragment_ToThrow,limit=1] run tp @s ^ ^1.55 ^
execute if predicate stardust:sneaking as @e[type=area_effect_cloud,tag=StardustFragment_ToThrow,limit=1] at @s run tp @s ~ ~-0.3 ~
execute unless score Bullet StardustFragment_Data matches 1.. run playsound minecraft:block.note_block.snare ambient @s ~ ~ ~ 1 0.5
execute if score Bullet StardustFragment_Data matches 1.. as @s[nbt={SelectedItem:{tag:{StardustFragment_StardustSniper:1b}}}] run playsound stardust:sniper_shot_1 ambient @a[distance=..20] ~ ~ ~ 0.5
execute if score Bullet StardustFragment_Data matches 1.. as @s[nbt={SelectedItem:{tag:{StardustFragment_AwakenedStardustSniper:1b}}}] run playsound stardust:sniper_shot_2 ambient @a[distance=..20] ~ ~ ~ 0.5
execute if score Bullet StardustFragment_Data matches 1.. as @s[nbt={SelectedItem:{tag:{StardustFragment_UltimateSniper:1b}}}] run playsound stardust:sniper_shot_3 ambient @a[distance=..20] ~ ~ ~ 0.5
execute if score Bullet StardustFragment_Data matches 1.. as @e[type=area_effect_cloud,tag=StardustFragment_ToThrow,limit=1] at @s run function stardust:rightclick/snipers/projectile_move
tag @s remove StardustFragment_Shooter
tag @e[tag=StardustFragment_Shooted] remove StardustFragment_Shooted
scoreboard players set @s StardustFragment_Cooldown 30
scoreboard players reset Bullet StardustFragment_Data
scoreboard players reset BulletDamage StardustFragment_Data
