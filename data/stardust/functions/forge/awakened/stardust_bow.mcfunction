
function stardust:forge/awakened/verif
scoreboard players set #forge_craft stardust.data 1
execute if score temp stardust.data matches 2 run function stardust:forge/global
execute if entity @s[scores={stardust.forge_craft=4..}] run function stardust:forge/awakened/stardust_bow_craft
