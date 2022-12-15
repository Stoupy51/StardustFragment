
data modify storage stardust:temp all set from block ~ ~ ~ Items

execute unless data storage stardust:temp all[{Slot:9b}].tag.simplenergy.texture_item run data modify storage stardust:main dropped_item set from storage stardust:temp all[{Slot:9b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:temp all[{Slot:10b}].tag.simplenergy.texture_item run data modify storage stardust:main dropped_item set from storage stardust:temp all[{Slot:10b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:temp all[{Slot:11b}].tag.simplenergy.texture_item run data modify storage stardust:main dropped_item set from storage stardust:temp all[{Slot:11b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:temp all[{Slot:12b}].tag.simplenergy.texture_item run data modify storage stardust:main dropped_item set from storage stardust:temp all[{Slot:12b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:temp all[{Slot:13b}].tag.simplenergy.texture_item run data modify storage stardust:main dropped_item set from storage stardust:temp all[{Slot:13b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:temp all[{Slot:14b}].tag.simplenergy.texture_item run data modify storage stardust:main dropped_item set from storage stardust:temp all[{Slot:14b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:temp all[{Slot:15b}].tag.simplenergy.texture_item run data modify storage stardust:main dropped_item set from storage stardust:temp all[{Slot:15b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:temp all[{Slot:16b}].tag.simplenergy.texture_item run data modify storage stardust:main dropped_item set from storage stardust:temp all[{Slot:16b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:temp all[{Slot:17b}].tag.simplenergy.texture_item run data modify storage stardust:main dropped_item set from storage stardust:temp all[{Slot:17b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:temp all[{Slot:18b}].tag.simplenergy.texture_item run data modify storage stardust:main dropped_item set from storage stardust:temp all[{Slot:18b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:temp all[{Slot:19b}].tag.stardust.quarry_start run data modify storage stardust:main dropped_item set from storage stardust:temp all[{Slot:19b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:temp all[{Slot:20b}].tag.stardust.quarry_pause run data modify storage stardust:main dropped_item set from storage stardust:temp all[{Slot:20b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:temp all[{Slot:21b}].tag.stardust.quarry_stop run data modify storage stardust:main dropped_item set from storage stardust:temp all[{Slot:21b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:temp all[{Slot:22b}].tag.simplenergy.texture_item run data modify storage stardust:main dropped_item set from storage stardust:temp all[{Slot:22b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:temp all[{Slot:23b}].tag.simplenergy.texture_item run data modify storage stardust:main dropped_item set from storage stardust:temp all[{Slot:23b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:temp all[{Slot:25b}].tag.stardust.quarry_manual run data modify storage stardust:main dropped_item set from storage stardust:temp all[{Slot:25b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:temp all[{Slot:26b}].tag.simplenergy.texture_item run data modify storage stardust:main dropped_item set from storage stardust:temp all[{Slot:26b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

data remove storage stardust:main dropped_item
data remove storage stardust:temp all
