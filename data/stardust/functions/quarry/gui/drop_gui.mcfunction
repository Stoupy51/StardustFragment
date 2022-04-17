
data modify storage stardust:main temp set from block ~ ~ ~ Items

execute unless data storage stardust:main temp[{Slot:9b,tag:{simplenergy:{texture_item:1b}}}] run data modify storage stardust:main dropped_item set from storage stardust:main temp[{Slot:9b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:main temp[{Slot:10b,tag:{simplenergy:{texture_item:1b}}}] run data modify storage stardust:main dropped_item set from storage stardust:main temp[{Slot:10b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:main temp[{Slot:11b,tag:{simplenergy:{texture_item:1b}}}] run data modify storage stardust:main dropped_item set from storage stardust:main temp[{Slot:11b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:main temp[{Slot:12b,tag:{simplenergy:{texture_item:1b}}}] run data modify storage stardust:main dropped_item set from storage stardust:main temp[{Slot:12b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:main temp[{Slot:13b,tag:{simplenergy:{texture_item:1b}}}] run data modify storage stardust:main dropped_item set from storage stardust:main temp[{Slot:13b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:main temp[{Slot:14b,tag:{simplenergy:{texture_item:1b}}}] run data modify storage stardust:main dropped_item set from storage stardust:main temp[{Slot:14b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:main temp[{Slot:15b,tag:{simplenergy:{texture_item:1b}}}] run data modify storage stardust:main dropped_item set from storage stardust:main temp[{Slot:15b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:main temp[{Slot:16b,tag:{simplenergy:{texture_item:1b}}}] run data modify storage stardust:main dropped_item set from storage stardust:main temp[{Slot:16b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:main temp[{Slot:17b,tag:{simplenergy:{texture_item:1b}}}] run data modify storage stardust:main dropped_item set from storage stardust:main temp[{Slot:17b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:main temp[{Slot:18b,tag:{simplenergy:{texture_item:1b}}}] run data modify storage stardust:main dropped_item set from storage stardust:main temp[{Slot:18b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:main temp[{Slot:19b,tag:{stardust:{quarry_start:1b}}}] run data modify storage stardust:main dropped_item set from storage stardust:main temp[{Slot:19b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:main temp[{Slot:20b,tag:{stardust:{quarry_pause:1b}}}] run data modify storage stardust:main dropped_item set from storage stardust:main temp[{Slot:20b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:main temp[{Slot:21b,tag:{stardust:{quarry_stop:1b}}}] run data modify storage stardust:main dropped_item set from storage stardust:main temp[{Slot:21b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:main temp[{Slot:22b,tag:{simplenergy:{texture_item:1b}}}] run data modify storage stardust:main dropped_item set from storage stardust:main temp[{Slot:22b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:main temp[{Slot:23b,tag:{simplenergy:{texture_item:1b}}}] run data modify storage stardust:main dropped_item set from storage stardust:main temp[{Slot:23b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:main temp[{Slot:25b,tag:{stardust:{quarry_manual:1b}}}] run data modify storage stardust:main dropped_item set from storage stardust:main temp[{Slot:25b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

execute unless data storage stardust:main temp[{Slot:26b,tag:{simplenergy:{texture_item:1b}}}] run data modify storage stardust:main dropped_item set from storage stardust:main temp[{Slot:26b}]
execute if data storage stardust:main dropped_item run function stardust:quarry/gui/dropped

data remove storage stardust:main dropped_item
data remove storage stardust:main temp
