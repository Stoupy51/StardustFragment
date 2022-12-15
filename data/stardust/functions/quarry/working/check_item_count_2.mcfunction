
#Check how many items got inserted in the quarry
data modify storage stardust:quarry all.Items set from block ~ ~ ~ Items
data remove storage stardust:quarry all.Items[{tag:{simplenergy:{texture_item:1b}}}]
scoreboard players set #temp_count stardust.data 0
execute if data storage stardust:quarry all.Items[0] run function stardust:quarry/working/storage_manipulation
scoreboard players operation #total_count stardust.data -= #temp_count stardust.data

#Reduce the item count
scoreboard players operation #item_count stardust.data += #total_count stardust.data
execute store result entity @s Item.Count byte 1 run scoreboard players get #item_count stardust.data

