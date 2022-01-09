function stardust:forge/awakened/verif
scoreboard players set SuperCraft StardustFragment_Data 1
execute if score Temp StardustFragment_Data matches 2 run function stardust:forge/global
execute if entity @s[scores={StardustFragment_SCraft=4..}] run function stardust:forge/awakened/item_magnet_craft
