tag @s add SF_Shooter

#Check what Sniper is it and set Base Damage
	execute as @s[nbt={SelectedItem:{tag:{SF_StardustSniper:1s}}}] run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:[SF_ToThrow,SF_Bullet,SF_StardustSniper],Age:0,Duration:0,Radius:0f}
	execute as @s[nbt={SelectedItem:{tag:{SF_AwakenedStardustSniper:1s}}}] run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:[SF_ToThrow,SF_Bullet,SF_AwakenedStardustSniper],Age:0,Duration:0,Radius:0f}
	execute as @s[nbt={SelectedItem:{tag:{SF_UltimateSniper:1s}}}] run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:[SF_ToThrow,SF_Bullet,SF_UltimateSniper],Age:0,Duration:0,Radius:0f}

	execute if entity @e[type=area_effect_cloud,tag=SF_StardustSniper,limit=1] run scoreboard players set BulletDamage SF_Data 5
	execute if entity @e[type=area_effect_cloud,tag=SF_AwakenedStardustSniper,limit=1] run scoreboard players set BulletDamage SF_Data 50
	execute if entity @e[type=area_effect_cloud,tag=SF_UltimateSniper,limit=1] run scoreboard players set BulletDamage SF_Data 130

#Check bullet and add damage
	execute as @s[nbt={Inventory:[{id:"minecraft:iron_nugget"}]}] run scoreboard players set Bullet SF_Data 1
	execute as @s[nbt={Inventory:[{id:"minecraft:gold_nugget"}]}] run scoreboard players set Bullet SF_Data 2
	execute as @s[nbt={Inventory:[{tag:{SF_StardustFragment:1s}}]}] run scoreboard players set Bullet SF_Data 3
	execute as @s[nbt={Inventory:[{tag:{SF_AwakenedStardust:1s}}]}] run scoreboard players set Bullet SF_Data 4
	execute as @s[nbt={Inventory:[{tag:{SF_UltimateBullet:1s}}]}] run scoreboard players set Bullet SF_Data 5
	execute if score Bullet SF_Data matches 1 run scoreboard players add BulletDamage SF_Data 5
	execute if score Bullet SF_Data matches 1 run clear @s minecraft:iron_nugget 1
	execute if score Bullet SF_Data matches 2 run scoreboard players add BulletDamage SF_Data 10
	execute if score Bullet SF_Data matches 2 run clear @s minecraft:gold_nugget 1
	execute if score Bullet SF_Data matches 3 run scoreboard players add BulletDamage SF_Data 15
	execute if score Bullet SF_Data matches 3 run clear @s minecraft:command_block{SF_StardustFragment:1s} 1
	execute if score Bullet SF_Data matches 4 run scoreboard players add BulletDamage SF_Data 20
	execute if score Bullet SF_Data matches 4 run clear @s minecraft:command_block{SF_AwakenedStardust:1s} 1
	execute if score Bullet SF_Data matches 5 run scoreboard players add BulletDamage SF_Data 2048
	execute if score Bullet SF_Data matches 5 run clear @s minecraft:command_block{SF_UltimateBullet:1s} 1

execute as @s[gamemode=creative] unless score Bullet SF_Data matches 1.. run scoreboard players set Bullet SF_Data 1
tp @e[type=area_effect_cloud,tag=SF_ToThrow,limit=1] @s
execute as @e[type=area_effect_cloud,tag=SF_ToThrow,limit=1] run tp @s ^ ^1.55 ^
execute if predicate stardust:sneaking as @e[type=area_effect_cloud,tag=SF_ToThrow,limit=1] at @s run tp @s ~ ~-0.3 ~
execute unless score Bullet SF_Data matches 1.. run playsound minecraft:block.note_block.snare ambient @s ~ ~ ~ 1 0.5
execute if score Bullet SF_Data matches 1.. as @s[nbt={SelectedItem:{tag:{SF_StardustSniper:1s}}}] run playsound stardust:sniper_shot_1 ambient @a[distance=..20] ~ ~ ~ 0.5
execute if score Bullet SF_Data matches 1.. as @s[nbt={SelectedItem:{tag:{SF_AwakenedStardustSniper:1s}}}] run playsound stardust:sniper_shot_2 ambient @a[distance=..20] ~ ~ ~ 0.5
execute if score Bullet SF_Data matches 1.. as @s[nbt={SelectedItem:{tag:{SF_UltimateSniper:1s}}}] run playsound stardust:sniper_shot_3 ambient @a[distance=..20] ~ ~ ~ 0.5
execute if score Bullet SF_Data matches 1.. as @e[type=area_effect_cloud,tag=SF_ToThrow,limit=1] at @s run function stardust:rightclick/snipers/projectile_move
tag @s remove SF_Shooter
tag @e[tag=SF_Shooted] remove SF_Shooted
scoreboard players set @s SF_Cooldown 30
scoreboard players set Bullet SF_Data 0
