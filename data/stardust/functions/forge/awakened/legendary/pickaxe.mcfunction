scoreboard players set #forge_craft stardust.data 2
function stardust:forge/global
execute if entity @s[scores={stardust.forge_craft=4..}] run function stardust:forge/awakened/legendary/pickaxe_craft
