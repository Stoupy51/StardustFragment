#Update visual
    data modify entity @s Item.tag.CustomModelData set value 2013231
    execute if score @s EF_kJ matches 500.. run data modify entity @s Item.tag.CustomModelData set value 2013232

#Kill Mobs
    execute store result score Rotation SF_Data run data get entity @s ItemRotation
    execute if score @s EF_kJ matches 500.. if score Rotation SF_Data matches 0 positioned ~ ~ ~3 as @e[type=!glow_item_frame,type=!player,type=!item,distance=..4] run data modify entity @s Health set value -1
    execute if score @s EF_kJ matches 500.. if score Rotation SF_Data matches 2 positioned ~-3 ~ ~ as @e[type=!glow_item_frame,type=!player,type=!item,distance=..4] run data modify entity @s Health set value -1
    execute if score @s EF_kJ matches 500.. if score Rotation SF_Data matches 4 positioned ~ ~ ~-3 as @e[type=!glow_item_frame,type=!player,type=!item,distance=..4] run data modify entity @s Health set value -1
    execute if score @s EF_kJ matches 500.. if score Rotation SF_Data matches 8 positioned ~3 ~ ~ as @e[type=!glow_item_frame,type=!player,type=!item,distance=..4] run data modify entity @s Health set value -1
    execute if score @s EF_kJ matches 500.. run scoreboard players remove @s EF_kJ 500
