execute if block ~ ~-1 ~ minecraft:hopper run data remove block ~ ~-1 ~ Items[{tag:{SE_CustomTextureItem:1s}}]
execute as @s[tag=SF_QuarryGui] run function stardust:quarry/gui/check
execute if entity @p[distance=..7] run function stardust:quarry/gui/all_gui
