scoreboard players set Success StardustFragment_Data 0
execute if block ~ ~-1 ~ minecraft:hopper store success score Success StardustFragment_Data run data remove block ~ ~-1 ~ Items[{tag:{SimplEnergy_CustomTextureItem:1b}}]
execute if block ~ ~-2 ~ minecraft:hopper store success score Success StardustFragment_Data run data remove block ~ ~-2 ~ Items[{tag:{SimplEnergy_CustomTextureItem:1b}}]
execute as @s[tag=StardustFragment_QuarryGui] run function stardust:quarry/gui/check
execute if score Success StardustFragment_Data matches 1 run function stardust:quarry/gui/all_gui
execute if entity @p[distance=..7] run function stardust:quarry/gui/all_gui
