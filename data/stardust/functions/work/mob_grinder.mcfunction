#Update visual
	data modify entity @s Item.tag.CustomModelData set value 2013231
	execute if score @s energy.storage matches 100.. run data modify entity @s Item.tag.CustomModelData set value 2013232

#Kill Mobs
	scoreboard players set Temp StardustFragment_Data 0
	execute store result score Y StardustFragment_Data run data get entity @s ItemRotation
	execute if score @s energy.storage matches 100.. if score Y StardustFragment_Data matches 0 positioned ~ ~ ~3 store result score Temp StardustFragment_Data run kill @e[type=#stardust:mob_grinder,tag=!global.ignore,tag=!global.ignore.kill,distance=..4] 
	execute if score @s energy.storage matches 100.. if score Y StardustFragment_Data matches 2 positioned ~-3 ~ ~ store result score Temp StardustFragment_Data run kill @e[type=#stardust:mob_grinder,tag=!global.ignore,tag=!global.ignore.kill,distance=..4]
	execute if score @s energy.storage matches 100.. if score Y StardustFragment_Data matches 4 positioned ~ ~ ~-3 store result score Temp StardustFragment_Data run kill @e[type=#stardust:mob_grinder,tag=!global.ignore,tag=!global.ignore.kill,distance=..4]
	execute if score @s energy.storage matches 100.. if score Y StardustFragment_Data matches 8 positioned ~3 ~ ~ store result score Temp StardustFragment_Data run kill @e[type=#stardust:mob_grinder,tag=!global.ignore,tag=!global.ignore.kill,distance=..4]
	execute unless score Temp StardustFragment_Data matches 0 run scoreboard players remove @s energy.storage 100
