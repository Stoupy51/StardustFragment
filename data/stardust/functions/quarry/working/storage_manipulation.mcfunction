
scoreboard players set #success stardust.data 0
execute store success score #success stardust.data run data modify storage stardust:main quarry.Items[0].id merge from storage stardust:main quarry.Item.id
execute if score #success stardust.data matches 0 store success score #success stardust.data run data modify storage stardust:main quarry.Items[0].tag merge from storage stardust:main quarry.Item.tag
execute if score #success stardust.data matches 0 store result score #count_2 stardust.data run data get storage stardust:main quarry.Items[0].Count
execute if score #success stardust.data matches 0 run scoreboard players operation #temp_count stardust.data += #count_2 stardust.data

data remove storage stardust:main quarry.Items[0]
execute if data storage stardust:main quarry.Items[0] run function stardust:quarry/working/storage_manipulation

