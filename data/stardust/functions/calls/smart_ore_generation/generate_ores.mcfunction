
# Dimension score, 0 = overworld, 1 = nether, 2 = end, 3 = cavern, 4 = stardust
scoreboard players set #dimension smart_ore_generation.data -1
execute if score #dimension smart_ore_generation.data matches -1 if predicate simplenergy:in_overworld run scoreboard players set #dimension smart_ore_generation.data 0
execute if score #dimension smart_ore_generation.data matches -1 if predicate stardust:in_dim/the_nether run scoreboard players set #dimension smart_ore_generation.data 1
execute if score #dimension smart_ore_generation.data matches -1 if predicate stardust:in_dim/the_end run scoreboard players set #dimension smart_ore_generation.data 2
execute if score #dimension smart_ore_generation.data matches -1 if predicate stardust:in_dim/cavern run scoreboard players set #dimension smart_ore_generation.data 3


# Generate Stardust Ore (x4) in every dimension except the_nether
scoreboard players operation #min_height smart_ore_generation.data = _OVERWORLD_BOTTOM smart_ore_generation.data
scoreboard players set #max_height smart_ore_generation.data 40
execute unless score #dimension smart_ore_generation.data matches 1 run function stardust:calls/smart_ore_generation/packs/stardust_x4


# Generate Awakened Stardust Ore (x8) in the_nether with max height at 150 blocks
execute if score #dimension smart_ore_generation.data matches 1 run scoreboard players set #max_height smart_ore_generation.data 150
execute if score #dimension smart_ore_generation.data matches 1 run function stardust:calls/smart_ore_generation/packs/awakened_stardust_x8


# Generate Simplunium Ore (x8) in the cavern dimension
scoreboard players set #max_height smart_ore_generation.data 400
execute if score #dimension smart_ore_generation.data matches 3 run function stardust:calls/smart_ore_generation/packs/simplunium_x8


# Generate Stardust Ore (x4) in the_end with max height at 160 blocks
execute if score #dimension smart_ore_generation.data matches 2 run scoreboard players set #max_height smart_ore_generation.data 160
execute if score #dimension smart_ore_generation.data matches 2 run function stardust:calls/smart_ore_generation/packs/stardust_x4


# Generate More Iron Ore (x56) in the cavern dimension with max height at 80 blocks
execute if score #dimension smart_ore_generation.data matches 3 run scoreboard players set #max_height smart_ore_generation.data 80
execute if score #dimension smart_ore_generation.data matches 3 run function stardust:calls/smart_ore_generation/packs/iron_x56


# Generate Life Crystals (x8) in all known dimensions with max height at 60 blocks but in the_end with max height at 240 blocks
scoreboard players set #max_height smart_ore_generation.data 60
execute if score #dimension smart_ore_generation.data matches 2 run scoreboard players set #max_height smart_ore_generation.data 240
execute if predicate stardust:in_dim/all run function stardust:calls/smart_ore_generation/packs/life_crystal_x8


# Generate Azalea Trees Features (x8) in the cavern dimension with max height at 100 blocks
scoreboard players set #max_height smart_ore_generation.data 100
execute if score #dimension smart_ore_generation.data matches 3 run function stardust:calls/smart_ore_generation/packs/azalea_tree_x8


# Generate Post Structures (Cave bases) in overworld with max height at 55 blocks
scoreboard players set #max_height smart_ore_generation.data 55
execute if score #dimension smart_ore_generation.data matches 0 run function stardust:calls/smart_ore_generation/structure/cave_base

