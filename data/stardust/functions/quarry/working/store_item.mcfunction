
#Storage & Scores setup
data modify storage stardust:quarry all.Items set from block ~ ~ ~ Items
execute store result score #slots_count stardust.data if data storage stardust:quarry all.Items[]
setblock -30000000 14 1610 yellow_shulker_box
data modify storage stardust:quarry all.Item set from entity @s Item
data modify block -30000000 14 1610 Items append from storage stardust:quarry all.Item
execute if score #slots_count stardust.data matches 27 run function stardust:quarry/working/check_item_count

loot insert ~ ~ ~ mine -30000000 14 1610 air{drop_contents:true}

execute if score #slots_count stardust.data matches 27 run function stardust:quarry/working/check_item_count_2
execute unless score #slots_count stardust.data matches 27 run kill @s

data remove storage stardust:main quarry
tag @s add stardust.mined_by_quarry
