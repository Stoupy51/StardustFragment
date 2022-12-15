
scoreboard players set #item_count stardust.data 0
data remove storage stardust:quarry all.Items[{tag:{simplenergy:{texture_item:1b}}}]
execute store result score #item_count stardust.data run data get storage stardust:quarry all.Item.Count

#Count how many this item is in the chest
scoreboard players set #temp_count stardust.data 0
function stardust:quarry/working/storage_manipulation
scoreboard players operation #total_count stardust.data = #temp_count stardust.data
