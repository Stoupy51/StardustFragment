data remove block ~ ~-1 ~ Items[{tag:{SE_CustomTextureItem:1b}}]
execute if entity @s[tag=SF_QuarryGui] run function stardust:quarry/gui/check_interact
execute if entity @p[distance=..7] run function stardust:quarry/gui/all_gui
