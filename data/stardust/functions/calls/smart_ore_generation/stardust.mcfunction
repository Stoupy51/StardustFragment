
## Try to find a random position adjacent to air in the region to generate the ore
function #smart_ore_generation:v1/slots/random_position

# Placing Stardust Ore Patch
execute at @s if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/smart_ore_generation/types/stardust
execute at @s positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/smart_ore_generation/types/stardust
execute at @s positioned ~ ~0.5 ~0.5 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/smart_ore_generation/types/stardust
execute at @s positioned ~0.5 ~0.5 ~ if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/smart_ore_generation/types/stardust
execute at @s positioned ~0.5 ~ ~0.5 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/smart_ore_generation/types/stardust
execute at @s positioned ~ ~0.5 ~ if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/smart_ore_generation/types/stardust

