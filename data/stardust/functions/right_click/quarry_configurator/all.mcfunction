
execute store result score Qx1 stardust.data_2 run data get entity @s SelectedItem.tag.stardust.quarry_x1
execute store result score Qy1 stardust.data_2 run data get entity @s SelectedItem.tag.stardust.quarry_y1
execute store result score Qz1 stardust.data_2 run data get entity @s SelectedItem.tag.stardust.quarry_z1
execute store result score Qx2 stardust.data_2 run data get entity @s SelectedItem.tag.stardust.quarry_x2
execute store result score Qy2 stardust.data_2 run data get entity @s SelectedItem.tag.stardust.quarry_y2
execute store result score Qz2 stardust.data_2 run data get entity @s SelectedItem.tag.stardust.quarry_z2

setblock -30000000 14 1610 minecraft:yellow_shulker_box
item replace block -30000000 14 1610 container.0 from entity @s weapon.mainhand

execute if predicate stardust:sneaking run function stardust:right_click/quarry_configurator/sneak
execute unless predicate stardust:sneaking run function stardust:right_click/quarry_configurator/no_sneak

data modify storage stardust:main temp set from block -30000000 14 1610 Items[0].tag
execute store result storage stardust:main temp.stardust.quarry_x1 int 1 run scoreboard players get Qx1 stardust.data_2
execute store result storage stardust:main temp.stardust.quarry_y1 int 1 run scoreboard players get Qy1 stardust.data_2
execute store result storage stardust:main temp.stardust.quarry_z1 int 1 run scoreboard players get Qz1 stardust.data_2
execute store result storage stardust:main temp.stardust.quarry_x2 int 1 run scoreboard players get Qx2 stardust.data_2
execute store result storage stardust:main temp.stardust.quarry_y2 int 1 run scoreboard players get Qy2 stardust.data_2
execute store result storage stardust:main temp.stardust.quarry_z2 int 1 run scoreboard players get Qz2 stardust.data_2
data modify block -30000000 14 1610 Items[0].tag set from storage stardust:main temp

scoreboard players reset Qx1 stardust.data_2
scoreboard players reset Qy1 stardust.data_2
scoreboard players reset Qz1 stardust.data_2
scoreboard players reset Qx2 stardust.data_2
scoreboard players reset Qy2 stardust.data_2
scoreboard players reset Qz2 stardust.data_2

item replace entity @s weapon.mainhand from block -30000000 14 1610 container.0
