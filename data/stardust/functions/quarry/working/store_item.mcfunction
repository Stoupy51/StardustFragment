
setblock -29999999 0 2013 minecraft:yellow_shulker_box
data modify block -29999999 0 2013 Items append from entity @s Item

scoreboard players set #item_stored stardust.data 0
execute store result score #item_stored stardust.data at @e[type=glow_item_frame,tag=stardust.quarry_stock,limit=1] run loot insert ~ ~ ~ mine -29999999 0 2013 minecraft:air{drop_contents:true}
execute unless score #item_stored stardust.data matches 0 run kill @s

tag @s add stardust.mined_by_quarry
