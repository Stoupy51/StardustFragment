setblock -29999999 0 2013 minecraft:yellow_shulker_box
scoreboard players set ItemStored StardustFragment_Data 0
data modify block -29999999 0 2013 Items append from entity @s Item
execute store result score ItemStored StardustFragment_Data at @e[type=glow_item_frame,tag=StardustFragment_QuarryStock,limit=1] run loot insert ~ ~ ~ mine -29999999 0 2013 minecraft:air{drop_contents:true}
execute unless score ItemStored StardustFragment_Data matches 0 run kill @s
tag @s add StardustFragment_MinedByQuarry
