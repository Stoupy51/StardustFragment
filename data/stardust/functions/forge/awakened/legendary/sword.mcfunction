scoreboard players set SuperCraft StardustFragment_Data 2
function stardust:forge/global
execute if entity @s[scores={StardustFragment_SCraft=4..}] run function stardust:forge/awakened/legendary/sword_craft
