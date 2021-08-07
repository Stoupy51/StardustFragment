scoreboard players reset * x

execute as @s store result score @s SF_X run data get entity @s Health 1
scoreboard players set 250 SF_X 250
scoreboard players operation @s SF_X -= 250 x
execute store result entity @s Health int 1 run scoreboard players get @s x

execute as @s store result score @s SF_X run data get entity @s AbsorptionAmount 1
scoreboard players set 16000 SF_X 16000
scoreboard players operation @s SF_X -= 16000 x
execute store result entity @s AbsorptionAmount int 1 run scoreboard players get @s x

execute as @e[type=ender_dragon,tag=ultime,tag=!ultimeDragon,tag=!ultimeDead] store result score @s SF_X run data get entity @s Health 1
tag @e[type=ender_dragon,tag=ultime,tag=!ultimeDragon,tag=!ultimeDead,scores={x=..5}] add ultimeDead

execute as @a at @s run playsound entity.ender_dragon.growl hostile @s
scoreboard players reset * x
tellraw @a ["",{"text":"[Stardust","color":"dark_aqua"},{"text":"Fragment] ","color":"aqua"},{"text":" Un des imposteurs a été vaincu donc l'"},{"text":"U","color":"dark_purple"},{"text":"l","color":"blue"},{"text":"t","color":"dark_aqua"},{"text":"i","color":"aqua"},{"text":"m","color":"green"},{"text":"a","color":"yellow"},{"text":"t","color":"gold"},{"text":"e","color":"dark_red"},{"text":" B","color":"dark_purple"},{"text":"o","color":"blue"},{"text":"s","color":"dark_aqua"},{"text":"s","color":"aqua"},{"text":" a donc perdu 25% de sa vie max !"}]
