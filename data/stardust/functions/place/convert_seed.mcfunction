
# Check if the block is a valid block (otherwise, kill and summon item)
scoreboard players set #success stardust.data 0
execute store success score #success stardust.data unless block ~ ~ ~ #simplenergy:air unless block ~ ~ ~ water unless block ~ ~ ~ lava
execute if score #success stardust.data matches 1 if entity @s[tag=stardust.diamond_seed] run loot spawn ~ ~0.1 ~ loot stardust:i/diamond_seed
execute if score #success stardust.data matches 1 if entity @s[tag=stardust.advanced_diamond_seed] run loot spawn ~ ~0.1 ~ loot stardust:i/advanced_diamond_seed
execute if score #success stardust.data matches 1 if entity @s[tag=stardust.stardust_seed] run loot spawn ~ ~0.1 ~ loot stardust:i/stardust_seed
execute if score #success stardust.data matches 1 if entity @s[tag=stardust.advanced_stardust_seed] run loot spawn ~ ~0.1 ~ loot stardust:i/advanced_stardust_seed
execute if score #success stardust.data matches 1 if entity @s[tag=stardust.elite_stardust_seed] run loot spawn ~ ~0.1 ~ loot stardust:i/elite_stardust_seed
execute if score #success stardust.data matches 1 if entity @s[tag=stardust.legendarium_seed] run loot spawn ~ ~0.1 ~ loot stardust:i/legendarium_seed
execute if score #success stardust.data matches 1 if entity @s[tag=stardust.solarium_seed] run loot spawn ~ ~0.1 ~ loot stardust:i/solarium_seed
execute if score #success stardust.data matches 1 if entity @s[tag=stardust.darkium_seed] run loot spawn ~ ~0.1 ~ loot stardust:i/darkium_seed

# Convert seed to an item_display (switch case for each seed type)
execute if score #success stardust.data matches 0 store success score #success stardust.data if entity @s[tag=stardust.diamond_seed] run function stardust:place/seeds/diamond/item_display
execute if score #success stardust.data matches 0 store success score #success stardust.data if entity @s[tag=stardust.advanced_diamond_seed] run function stardust:place/seeds/advanced_diamond/item_display
execute if score #success stardust.data matches 0 store success score #success stardust.data if entity @s[tag=stardust.stardust_seed] run function stardust:place/seeds/stardust/item_display
execute if score #success stardust.data matches 0 store success score #success stardust.data if entity @s[tag=stardust.advanced_stardust_seed] run function stardust:place/seeds/advanced_stardust/item_display
execute if score #success stardust.data matches 0 store success score #success stardust.data if entity @s[tag=stardust.elite_stardust_seed] run function stardust:place/seeds/elite_stardust/item_display
execute if score #success stardust.data matches 0 store success score #success stardust.data if entity @s[tag=stardust.legendarium_seed] run function stardust:place/seeds/legendarium/item_display
execute if score #success stardust.data matches 0 store success score #success stardust.data if entity @s[tag=stardust.solarium_seed] run function stardust:place/seeds/solarium/item_display
execute if score #success stardust.data matches 0 store success score #success stardust.data if entity @s[tag=stardust.darkium_seed] run function stardust:place/seeds/darkium/item_display

# Kill item_frame
scoreboard players set #killed stardust.data 1
kill @s

