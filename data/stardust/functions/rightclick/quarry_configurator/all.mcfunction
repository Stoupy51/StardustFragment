execute store result score Qx1 StardustFragment_X run data get entity @s SelectedItem.tag.StardustFragment_Qx1
execute store result score Qy1 StardustFragment_X run data get entity @s SelectedItem.tag.StardustFragment_Qy1
execute store result score Qz1 StardustFragment_X run data get entity @s SelectedItem.tag.StardustFragment_Qz1
execute store result score Qx2 StardustFragment_X run data get entity @s SelectedItem.tag.StardustFragment_Qx2
execute store result score Qy2 StardustFragment_X run data get entity @s SelectedItem.tag.StardustFragment_Qy2
execute store result score Qz2 StardustFragment_X run data get entity @s SelectedItem.tag.StardustFragment_Qz2

setblock -29999999 0 2013 minecraft:yellow_shulker_box
item replace block -29999999 0 2013 container.0 from entity @s weapon.mainhand

execute if predicate stardust:sneaking run function stardust:rightclick/quarry_configurator/sneak
execute unless predicate stardust:sneaking run function stardust:rightclick/quarry_configurator/no_sneak

execute store result block -29999999 0 2013 Items[0].tag.StardustFragment_Qx1 int 1 run scoreboard players get Qx1 StardustFragment_X
execute store result block -29999999 0 2013 Items[0].tag.StardustFragment_Qy1 int 1 run scoreboard players get Qy1 StardustFragment_X
execute store result block -29999999 0 2013 Items[0].tag.StardustFragment_Qz1 int 1 run scoreboard players get Qz1 StardustFragment_X
execute store result block -29999999 0 2013 Items[0].tag.StardustFragment_Qx2 int 1 run scoreboard players get Qx2 StardustFragment_X
execute store result block -29999999 0 2013 Items[0].tag.StardustFragment_Qy2 int 1 run scoreboard players get Qy2 StardustFragment_X
execute store result block -29999999 0 2013 Items[0].tag.StardustFragment_Qz2 int 1 run scoreboard players get Qz2 StardustFragment_X

item replace entity @s weapon.mainhand from block -29999999 0 2013 container.0
