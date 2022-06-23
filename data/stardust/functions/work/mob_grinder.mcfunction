#Update visual
	data modify entity @s Item.tag.CustomModelData set value 2013314
	execute if score @s energy.storage matches 100.. run data modify entity @s Item.tag.CustomModelData set value 2013315

#Kill Mobs
	scoreboard players set #success stardust.data 0
	execute store result score Y stardust.data run data get entity @s ItemRotation
	execute if score @s energy.storage matches 100.. if score Y stardust.data matches 0 positioned ~ ~ ~3 store success score #success stardust.data run kill @e[type=#stardust:mob_grinder,tag=!global.ignore,tag=!global.ignore.kill,distance=..4] 
	execute if score @s energy.storage matches 100.. if score Y stardust.data matches 2 positioned ~-3 ~ ~ store success score #success stardust.data run kill @e[type=#stardust:mob_grinder,tag=!global.ignore,tag=!global.ignore.kill,distance=..4]
	execute if score @s energy.storage matches 100.. if score Y stardust.data matches 4 positioned ~ ~ ~-3 store success score #success stardust.data run kill @e[type=#stardust:mob_grinder,tag=!global.ignore,tag=!global.ignore.kill,distance=..4]
	execute if score @s energy.storage matches 100.. if score Y stardust.data matches 8 positioned ~3 ~ ~ store success score #success stardust.data run kill @e[type=#stardust:mob_grinder,tag=!global.ignore,tag=!global.ignore.kill,distance=..4]
	execute if score #success stardust.data matches 1 run scoreboard players remove @s energy.storage 100
