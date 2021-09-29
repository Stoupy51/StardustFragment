#Update visual
	data modify entity @s Item.tag.CustomModelData set value 2013231
	execute if score @s EF_kJ matches 500.. run data modify entity @s Item.tag.CustomModelData set value 2013232

#Kill Mobs
	scoreboard players set Temp SF_Data 0
	execute store result score Y SF_Data run data get entity @s ItemRotation
	execute if score @s EF_kJ matches 500.. if score Y SF_Data matches 0 positioned ~ ~ ~3 store result score Temp SF_Data run kill @e[type=#stardust:mob_grinder,distance=..4] 
	execute if score @s EF_kJ matches 500.. if score Y SF_Data matches 2 positioned ~-3 ~ ~ store result score Temp SF_Data run kill @e[type=#stardust:mob_grinder,distance=..4]
	execute if score @s EF_kJ matches 500.. if score Y SF_Data matches 4 positioned ~ ~ ~-3 store result score Temp SF_Data run kill @e[type=#stardust:mob_grinder,distance=..4]
	execute if score @s EF_kJ matches 500.. if score Y SF_Data matches 8 positioned ~3 ~ ~ store result score Temp SF_Data run kill @e[type=#stardust:mob_grinder,distance=..4]
	execute unless score Temp SF_Data matches 0 run scoreboard players remove @s EF_kJ 500
