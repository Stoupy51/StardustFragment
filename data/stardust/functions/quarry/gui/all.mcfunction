scoreboard players set Success SF_Data 0
execute if block ~ ~-1 ~ minecraft:hopper store success score Success SF_Data run data remove block ~ ~-1 ~ Items[{tag:{SE_CustomTextureItem:1s}}]
execute if block ~ ~-2 ~ minecraft:hopper store success score Success SF_Data run data remove block ~ ~-2 ~ Items[{tag:{SE_CustomTextureItem:1s}}]
execute as @s[tag=SF_QuarryGui] run function stardust:quarry/gui/check
execute if score Success SF_Data matches 1 run function stardust:quarry/gui/all_gui
execute if entity @p[distance=..7] run function stardust:quarry/gui/all_gui
