
#Stardust Ore
execute unless block ~ ~ ~ netherrack unless block ~ ~ ~ deepslate unless block ~ ~ ~ end_stone run function stardust:place/stardust_ore/optimized_for_generation
#Nether Stardust Ore
execute if block ~ ~ ~ netherrack run function stardust:place/nether_stardust_ore/optimized_for_generation
#Ender Stardust Ore
execute if block ~ ~ ~ end_stone run function stardust:place/ender_stardust_ore/optimized_for_generation
#Deepslate Stardust Ore
execute if block ~ ~ ~ deepslate run function stardust:place/deepslate_stardust_ore/optimized_for_generation

#Update Stats
scoreboard players add StardustOreCount stardust.advanced_stats 1

