
##Called by function tag #smithed.craft:event/shapeless_recipes

scoreboard players set #consume_tools stardust.data 0

#Stardust Manual
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:1b,id:"minecraft:book"},{Count:1b,tag:{ctc:{id:"stardust_fragment"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/stardust_manual
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"stardust_manual"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/stardust_manual

#Stardust Fragment
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"stardust_ingot"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/stardust_fragment_x8
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"compacted_stardust"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/stardust_fragment

#Stardust Ingot
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"stardust_block"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/stardust_ingot_x9
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_fragment"}}},{Count:1b,id:"minecraft:iron_ingot"}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/stardust_ingot
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"stardust_essence"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/stardust_ingot_x8

#Stardust Essence
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_ingot"}}},{Count:1b,id:"minecraft:blaze_powder"}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/stardust_essence
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"stardust_config"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/stardust_essence_x8

#Stardust Config
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_essence"}}},{Count:1b,tag:{ctc:{id:"quadruple_compressed_cobblestone"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/stardust_config

#Awakened Stardust
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"awakened_stardust_block"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/awakened_stardust_x9

#Awakened Stardust Block
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:9b,tag:{ctc:{id:"awakened_stardust"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/awakened_stardust_block

#Dragon Pearl
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,id:"minecraft:dragon_breath"},{Count:1b,id:"minecraft:ender_pearl"}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/dragon_pearl

#Ender Dragon Pearl
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,id:"minecraft:ender_pearl"},{Count:1b,tag:{ctc:{id:"dragon_pearl"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/ender_dragon_pearl

#Compacted Stardust
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,id:"minecraft:blue_concrete"},{Count:1b,tag:{ctc:{id:"stardust_fragment"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/compacted_stardust
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"very_compacted_stardust"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/compacted_stardust_x9

#Very Compacted Stardust
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:9b,tag:{ctc:{id:"compacted_stardust"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/very_compacted_stardust

#Stardust Block
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:9b,tag:{ctc:{id:"stardust_ingot"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/stardust_block

#Empty Module
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,id:"minecraft:paper"},{Count:1b,tag:{ctc:{id:"simplunium_ingot"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/empty_module

#Legendarium, Solarium, Darkium, Ultimate Fragments
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"legendarium_ingot"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/legendarium_fragment_x8
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"solarium_ingot"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/solarium_fragment_x8
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"darkium_ingot"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/darkium_fragment_x8
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 9 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"stardust_fragment"}}},{Count:1b,tag:{ctc:{id:"compacted_stardust"}}},{Count:1b,tag:{ctc:{id:"very_compacted_stardust"}}},{Count:1b,tag:{ctc:{id:"legendarium_fragment"}}},{Count:1b,tag:{ctc:{id:"solarium_fragment"}}},{Count:1b,tag:{ctc:{id:"darkium_fragment"}}},{Count:1b,tag:{ctc:{id:"awakened_stardust"}}},{Count:1b,tag:{ctc:{id:"dragon_pearl"}}},{Count:1b,tag:{ctc:{id:"ender_dragon_pearl"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/ultimate_fragment
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"ultimate_ingot"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/ultimate_fragment_x8

#Damaged Stardust Equipments
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] store result score #consume_tools stardust.data if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_ingot"}}},{Count:1b,id:"minecraft:diamond_helmet"}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/damaged_stardust_helmet
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] store result score #consume_tools stardust.data if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_ingot"}}},{Count:1b,id:"minecraft:diamond_chestplate"}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/damaged_stardust_chestplate
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] store result score #consume_tools stardust.data if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_ingot"}}},{Count:1b,id:"minecraft:diamond_leggings"}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/damaged_stardust_leggings
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] store result score #consume_tools stardust.data if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_ingot"}}},{Count:1b,id:"minecraft:diamond_boots"}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/damaged_stardust_boots
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] store result score #consume_tools stardust.data if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_ingot"}}},{Count:1b,id:"minecraft:diamond_sword"}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/damaged_stardust_sword
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] store result score #consume_tools stardust.data if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_ingot"}}},{Count:1b,id:"minecraft:diamond_pickaxe"}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/damaged_stardust_pickaxe
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] store result score #consume_tools stardust.data if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_ingot"}}},{Count:1b,id:"minecraft:diamond_axe"}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/damaged_stardust_axe

#Reinforced Stardust Equipments
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] store result score #consume_tools stardust.data if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_essence"}}},{Count:1b,id:"minecraft:leather_helmet",tag:{stardust:{damaged:1b}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/reinforced_stardust_helmet
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] store result score #consume_tools stardust.data if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_essence"}}},{Count:1b,id:"minecraft:leather_chestplate",tag:{stardust:{damaged:1b}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/reinforced_stardust_chestplate
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] store result score #consume_tools stardust.data if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_essence"}}},{Count:1b,id:"minecraft:leather_leggings",tag:{stardust:{damaged:1b}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/reinforced_stardust_leggings
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] store result score #consume_tools stardust.data if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_essence"}}},{Count:1b,id:"minecraft:leather_boots",tag:{stardust:{damaged:1b}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/reinforced_stardust_boots
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] store result score #consume_tools stardust.data if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_essence"}}},{Count:1b,id:"minecraft:stone_sword",tag:{stardust:{damaged:1b}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/reinforced_stardust_sword
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] store result score #consume_tools stardust.data if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_essence"}}},{Count:1b,id:"minecraft:stone_pickaxe",tag:{stardust:{damaged:1b}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/reinforced_stardust_pickaxe
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] store result score #consume_tools stardust.data if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_essence"}}},{Count:1b,id:"minecraft:stone_axe",tag:{stardust:{damaged:1b}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/reinforced_stardust_axe

#Original Stardust Equipments
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] store result score #consume_tools stardust.data if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_config"}}},{Count:1b,id:"minecraft:leather_helmet",tag:{stardust:{reinforced:1b}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/original_stardust_helmet
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] store result score #consume_tools stardust.data if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_config"}}},{Count:1b,id:"minecraft:leather_chestplate",tag:{stardust:{reinforced:1b}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/original_stardust_chestplate
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] store result score #consume_tools stardust.data if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_config"}}},{Count:1b,id:"minecraft:leather_leggings",tag:{stardust:{reinforced:1b}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/original_stardust_leggings
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] store result score #consume_tools stardust.data if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_config"}}},{Count:1b,id:"minecraft:leather_boots",tag:{stardust:{reinforced:1b}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/original_stardust_boots
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] store result score #consume_tools stardust.data if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_config"}}},{Count:1b,id:"minecraft:iron_sword",tag:{stardust:{reinforced:1b}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/original_stardust_sword
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] store result score #consume_tools stardust.data if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_config"}}},{Count:1b,id:"minecraft:iron_pickaxe",tag:{stardust:{reinforced:1b}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/original_stardust_pickaxe
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] store result score #consume_tools stardust.data if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_config"}}},{Count:1b,id:"minecraft:iron_axe",tag:{stardust:{reinforced:1b}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/original_stardust_axe

#Wormhole Potion
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,id:"minecraft:tropical_fish"},{Count:1b,id:"minecraft:potion"}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/wormhole_potion

#Travel Staff
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:1b,id:"minecraft:stick"},{Count:1b,tag:{ctc:{id:"dragon_pearl"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/travel_staff

#Ultimate Bullet
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"ultimate_core"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/ultimate_bullet_x32

#Stardust Apple
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_ingot"}}},{Count:1b,id:"minecraft:golden_apple"}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/stardust_apple

#Wither Killer
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"awakened_stardust"}}},{Count:8b,id:"minecraft:wither_skeleton_skull"}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/wither_killer

#Stardust Pillar
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_ingot"}}},{Count:1b,id:"minecraft:nether_star"}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/stardust_pillar

#Diamond Seed
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,id:"minecraft:wheat_seeds"},{Count:1b,id:"minecraft:diamond"}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/diamond_seed

#Advanced Diamond Seed
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,id:"minecraft:diamond"},{Count:1b,tag:{ctc:{id:"diamond_seeds"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/advanced_diamond_seed

#Stardust Seed
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,id:"minecraft:wheat_seeds"},{Count:1b,tag:{ctc:{id:"stardust_fragment"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/stardust_seed

#Advanced Stardust Seed
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"stardust_seeds"}}},{Count:8b,tag:{ctc:{id:"stardust_fragment"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/advanced_stardust_seed

#Elite Stardust Seed
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"advanced_stardust_seeds"}}},{Count:8b,tag:{ctc:{id:"stardust_ingot"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/elite_stardust_seed

#Elementary Seeds
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:1b,id:"minecraft:lime_dye"},{Count:8b,tag:{ctc:{id:"awakened_stardust"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/legendarium_seed
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:1b,id:"minecraft:orange_dye"},{Count:8b,tag:{ctc:{id:"awakened_stardust"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/solarium_seed
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:1b,id:"minecraft:black_dye"},{Count:8b,tag:{ctc:{id:"awakened_stardust"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/darkium_seed

#Cavern Portal
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"stardust_fragment"}}},{Count:8b,tag:{ctc:{id:"compressed_cobblestone"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/cavern_portal

#Celestial Portal
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"stardust_fragment"}}},{Count:8b,id:"minecraft:iron_block"}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/celestial_portal

#Stardust Portal
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"stardust_fragment"}}},{Count:8b,tag:{ctc:{id:"very_compacted_stardust"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/stardust_portal

#Stardust Dungeon Portal
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"stardust_portal"}}},{Count:8b,tag:{ctc:{id:"awakened_stardust_block"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/stardust_dungeon_portal

#Quarry (Lv2 -> Lv5)
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_ingot"}}},{Count:1b,tag:{ctc:{id:"quarry_lv1"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/quarry_lv2
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_essence"}}},{Count:1b,tag:{ctc:{id:"quarry_lv2"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/quarry_lv3
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"dragon_pearl"}}},{Count:1b,tag:{ctc:{id:"quarry_lv3"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/quarry_lv4
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"ender_dragon_pearl"}}},{Count:1b,tag:{ctc:{id:"quarry_lv4"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/quarry_lv5

#Silk Touch Module
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"empty_module"}}},{Count:8b,id:"minecraft:iron_ore"}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/silk_touch_module

#Fortune Module
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 3 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"empty_module"}}},{Count:4b,id:"minecraft:diamond"},{Count:4b,id:"minecraft:emerald"}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/fortune_module

#Stoupy's Egg
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"dog_excrement"}}},{Count:1b,id:"minecraft:cake"}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/stoup_egg

#Health Artefacts
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:2b,tag:{ctc:{id:"health_artifact_lv1"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/health_artifact_lv2
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:2b,tag:{ctc:{id:"health_artifact_lv2"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/health_artifact_lv3
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:2b,tag:{ctc:{id:"health_artifact_lv3"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/health_artifact_lvmax

#Damage Artefacts
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:2b,tag:{ctc:{id:"damage_artifact_lv1"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/damage_artifact_lv2
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:2b,tag:{ctc:{id:"damage_artifact_lv2"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/damage_artifact_lv3
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:2b,tag:{ctc:{id:"damage_artifact_lv3"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/damage_artifact_lvmax

#Speed Artefacts
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:2b,tag:{ctc:{id:"speed_artifact_lv1"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/speed_artifact_lv2
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:2b,tag:{ctc:{id:"speed_artifact_lv2"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/speed_artifact_lv3
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:2b,tag:{ctc:{id:"speed_artifact_lv3"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/speed_artifact_lvmax

#Cobblestone Miners (Lv1 -> Lv5)
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"triple_compressed_cobblestone"}}},{Count:1b,id:"minecraft:diamond_pickaxe"}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/cobblestone_miner_lv1
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_fragment"}}},{Count:1b,tag:{ctc:{id:"cobblestone_miner_lv1"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/cobblestone_miner_lv2
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_ingot"}}},{Count:1b,tag:{ctc:{id:"cobblestone_miner_lv2"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/cobblestone_miner_lv3
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_essence"}}},{Count:1b,tag:{ctc:{id:"cobblestone_miner_lv3"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/cobblestone_miner_lv4
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"stardust_config"}}},{Count:1b,tag:{ctc:{id:"cobblestone_miner_lv4"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/cobblestone_miner_lv5

#Elevator
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,id:"minecraft:iron_block"},{Count:1b,id:"minecraft:copper_block"}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/elevator

#Heat Generator
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 3 if data storage smithed.crafter:input {recipe:[{Count:4b,id:"minecraft:iron_block"},{Count:4b,id:"minecraft:glass"},{Count:1b,tag:{ctc:{id:"machine_frame"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/heat_generator

#Stardust Cables
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 3 if data storage smithed.crafter:input {recipe:[{Count:4b,id:"minecraft:gold_block"},{Count:4b,tag:{ctc:{id:"stardust_block"}}},{Count:1b,tag:{ctc:{id:"elite_cable"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/stardust_cable
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 3 if data storage smithed.crafter:input {recipe:[{Count:4b,tag:{ctc:{id:"awakened_stardust"}}},{Count:4b,tag:{ctc:{id:"awakened_stardust_block"}}},{Count:1b,tag:{ctc:{id:"stardust_cable"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/awakened_stardust_cable
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"ultimate_fragment"}}},{Count:1b,tag:{ctc:{id:"awakened_stardust_cable"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/ultimate_cable

#Compressed Cobblestones
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:9b,id:"minecraft:cobblestone"}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/compressed_cobblestone
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:9b,tag:{ctc:{id:"compressed_cobblestone"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/double_compressed_cobblestone
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:9b,tag:{ctc:{id:"double_compressed_cobblestone"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/triple_compressed_cobblestone
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:9b,tag:{ctc:{id:"triple_compressed_cobblestone"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/quadruple_compressed_cobblestone
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:9b,tag:{ctc:{id:"quadruple_compressed_cobblestone"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/quintuple_compressed_cobblestone
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:9b,tag:{ctc:{id:"quintuple_compressed_cobblestone"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/sextuple_compressed_cobblestone
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:9b,tag:{ctc:{id:"sextuple_compressed_cobblestone"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/septuple_compressed_cobblestone
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:9b,tag:{ctc:{id:"septuple_compressed_cobblestone"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/octuple_compressed_cobblestone

	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"compressed_cobblestone"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/cobblestone_x9
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"double_compressed_cobblestone"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/compressed_cobblestone_x9
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"triple_compressed_cobblestone"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/double_compressed_cobblestone_x9
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"quadruple_compressed_cobblestone"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/triple_compressed_cobblestone_x9
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"quintuple_compressed_cobblestone"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/quadruple_compressed_cobblestone_x9
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"sextuple_compressed_cobblestone"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/quintuple_compressed_cobblestone_x9
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"septuple_compressed_cobblestone"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/sextuple_compressed_cobblestone_x9
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"octuple_compressed_cobblestone"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/septuple_compressed_cobblestone_x9

#Legendarium, Solarium, Darkium, Ultimate Ingots
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"legendarium_fragment"}}},{Count:1b,tag:{ctc:{id:"stardust_ingot"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/legendarium_ingot
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"legendarium_block"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/legendarium_ingot_x9
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"solarium_fragment"}}},{Count:1b,tag:{ctc:{id:"stardust_ingot"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/solarium_ingot
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"solarium_block"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/solarium_ingot_x9
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"darkium_fragment"}}},{Count:1b,tag:{ctc:{id:"stardust_ingot"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/darkium_ingot
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:1b,tag:{ctc:{id:"darkium_block"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/darkium_ingot_x9
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,tag:{ctc:{id:"ultimate_fragment"}}},{Count:1b,tag:{ctc:{id:"stardust_ingot"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/ultimate_ingot

#Legendarium, Solarium, Darkium Blocks
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:9b,tag:{ctc:{id:"legendarium_ingot"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/legendarium_block
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:9b,tag:{ctc:{id:"solarium_ingot"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/solarium_block
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 1 if data storage smithed.crafter:input {recipe:[{Count:9b,tag:{ctc:{id:"darkium_ingot"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/darkium_block

#Life Crystal Block
	execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if score count smithed.data matches 2 if data storage smithed.crafter:input {recipe:[{Count:8b,id:"minecraft:glass"},{Count:1b,tag:{ctc:{id:"life_crystal"}}}]} run loot replace block ~ ~ ~ container.16 loot stardust:i/life_crystal_block


execute if score #consume_tools stardust.data matches 1 run data modify storage smithed.crafter:input flags append value "consume_tools"
