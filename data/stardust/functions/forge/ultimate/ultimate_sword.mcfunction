function stardust:forge/ultimate/verif
scoreboard players set SuperCraft StardustFragment_Data 2
execute if score Temp StardustFragment_Data matches 2 run function stardust:forge/global
execute if entity @s[scores={StardustFragment_SCraft=4..}] run function stardust:forge/ultimate/ultimate_sword_craft
