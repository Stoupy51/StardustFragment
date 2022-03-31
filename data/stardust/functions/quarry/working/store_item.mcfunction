
setblock -29999999 0 2013 minecraft:yellow_shulker_box
scoreboard players set ItemStored stardust.data 0
data modify block -29999999 0 2013 Items append from entity @s Item
execute store result score ItemStored stardust.data at @e[type=glow_item_frame,tag=stardust.quarryStock,limit=1] run loot insert ~ ~ ~ mine -29999999 0 2013 minecraft:air{drop_contents:true}
execute unless score ItemStored stardust.data matches 0 run kill @s
tag @s add stardust.mined_by_quarry
