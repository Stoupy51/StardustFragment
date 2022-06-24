
scoreboard players set #success stardust.data 0
data modify storage stardust:main Item set from block ~ ~1 ~ Items[0]
data modify storage stardust:main Hopper set from entity @s Items
execute store success score #success stardust.data unless data storage stardust:main Item.tag.simplenergy.texture_item

execute if score #success stardust.data matches 1 run function stardust:quarry/extract/slot
execute if score #success stardust.data matches 1 run data modify entity @s Items append from storage stardust:main Item
execute if score #success stardust.data matches 1 run data remove block ~ ~1 ~ Items[0]
