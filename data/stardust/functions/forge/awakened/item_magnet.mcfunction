function stardust:forge/awakened/verif
scoreboard players set SuperCraft SF_Data 1
execute if score Temp SF_Data matches 2 run function stardust:forge/global
execute as @s[scores={SF_SCraft=4..}] run function stardust:forge/awakened/item_magnet_craft
