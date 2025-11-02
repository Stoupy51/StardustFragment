
#> stardust:calls/smart_ore_generation/generate_ores
#
# @within	#smart_ore_generation:v1/signals/generate_ores
#

# Generate Stardust Ore (x1)
scoreboard players set #dimension smart_ore_generation.data -1
execute if dimension minecraft:overworld run scoreboard players set #dimension smart_ore_generation.data 0
execute if dimension stardust:cavern run scoreboard players set #dimension smart_ore_generation.data 1
execute if dimension stardust:celestial run scoreboard players set #dimension smart_ore_generation.data 2
scoreboard players set #min_height smart_ore_generation.data 0
scoreboard players set #max_height smart_ore_generation.data 50
execute if score #dimension smart_ore_generation.data matches 0.. run function stardust:calls/smart_ore_generation/veins/stardust_ore

# Generate Deepslate Stardust Ore (x1)
scoreboard players set #dimension smart_ore_generation.data -1
execute if dimension minecraft:overworld run scoreboard players set #dimension smart_ore_generation.data 0
execute if dimension stardust:cavern run scoreboard players set #dimension smart_ore_generation.data 1
execute if dimension stardust:celestial run scoreboard players set #dimension smart_ore_generation.data 2
scoreboard players operation #min_height smart_ore_generation.data = _OVERWORLD_BOTTOM smart_ore_generation.data
scoreboard players set #max_height smart_ore_generation.data 0
execute if score #dimension smart_ore_generation.data matches 0.. run function stardust:calls/smart_ore_generation/veins/deepslate_stardust_ore

# Generate Nether Stardust Ore (x1)
scoreboard players set #dimension smart_ore_generation.data -1
execute if dimension minecraft:the_nether run scoreboard players set #dimension smart_ore_generation.data 0
scoreboard players set #min_height smart_ore_generation.data 25
scoreboard players set #max_height smart_ore_generation.data 120
execute if score #dimension smart_ore_generation.data matches 0.. run function stardust:calls/smart_ore_generation/veins/nether_stardust_ore

# Generate Awakened Stardust Ore (x1)
scoreboard players set #dimension smart_ore_generation.data -1
execute if dimension minecraft:the_nether run scoreboard players set #dimension smart_ore_generation.data 0
scoreboard players set #min_height smart_ore_generation.data 25
scoreboard players set #max_height smart_ore_generation.data 120
execute if score #dimension smart_ore_generation.data matches 0.. run function stardust:calls/smart_ore_generation/veins/awakened_stardust_ore

# Generate Ender Stardust Ore (x1)
scoreboard players set #dimension smart_ore_generation.data -1
execute if dimension minecraft:the_end run scoreboard players set #dimension smart_ore_generation.data 0
scoreboard players set #min_height smart_ore_generation.data 25
scoreboard players set #max_height smart_ore_generation.data 80
execute if score #dimension smart_ore_generation.data matches 0.. run function stardust:calls/smart_ore_generation/veins/ender_stardust_ore

