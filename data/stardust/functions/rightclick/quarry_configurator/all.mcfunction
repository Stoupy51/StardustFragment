execute store result score Qx1 SF_X run data get entity @s SelectedItem.tag.SF_Qx1
execute store result score Qy1 SF_X run data get entity @s SelectedItem.tag.SF_Qy1
execute store result score Qz1 SF_X run data get entity @s SelectedItem.tag.SF_Qz1
execute store result score Qx2 SF_X run data get entity @s SelectedItem.tag.SF_Qx2
execute store result score Qy2 SF_X run data get entity @s SelectedItem.tag.SF_Qy2
execute store result score Qz2 SF_X run data get entity @s SelectedItem.tag.SF_Qz2

setblock -29999999 0 2013 minecraft:yellow_shulker_box
item replace block -29999999 0 2013 container.0 from entity @s weapon.mainhand

execute if predicate stardust:sneaking run function stardust:rightclick/quarry_configurator/sneak
execute unless predicate stardust:sneaking run function stardust:rightclick/quarry_configurator/no_sneak

execute store result block -29999999 0 2013 Items[0].tag.SF_Qx1 int 1 run scoreboard players get Qx1 SF_X
execute store result block -29999999 0 2013 Items[0].tag.SF_Qy1 int 1 run scoreboard players get Qy1 SF_X
execute store result block -29999999 0 2013 Items[0].tag.SF_Qz1 int 1 run scoreboard players get Qz1 SF_X
execute store result block -29999999 0 2013 Items[0].tag.SF_Qx2 int 1 run scoreboard players get Qx2 SF_X
execute store result block -29999999 0 2013 Items[0].tag.SF_Qy2 int 1 run scoreboard players get Qy2 SF_X
execute store result block -29999999 0 2013 Items[0].tag.SF_Qz2 int 1 run scoreboard players get Qz2 SF_X

item replace entity @s weapon.mainhand from block -29999999 0 2013 container.0
