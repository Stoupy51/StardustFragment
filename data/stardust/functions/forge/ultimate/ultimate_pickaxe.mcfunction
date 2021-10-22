function stardust:forge/ultimate/verif
scoreboard players set SuperCraft SF_Data 2
execute if score Temp SF_Data matches 2 run function stardust:forge/global
execute as @s[scores={SF_SCraft=4..}] run function stardust:forge/ultimate/ultimate_pickaxe_craft
