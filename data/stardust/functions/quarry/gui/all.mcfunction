scoreboard players set #success stardust.data 0
execute if block ~ ~-1 ~ minecraft:hopper store success score #success stardust.data run data remove block ~ ~-1 ~ Items[{tag:{simplenergy:{texture_item:1b}}}]
execute if block ~ ~-2 ~ minecraft:hopper store success score #success stardust.data run data remove block ~ ~-2 ~ Items[{tag:{simplenergy:{texture_item:1b}}}]
execute if entity @s[tag=stardust.quarry_gui] run function stardust:quarry/gui/check
execute if score #success stardust.data matches 1 run function stardust:quarry/gui/all_gui
execute if entity @p[distance=..7] run function stardust:quarry/gui/all_gui
