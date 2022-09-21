
tag @s add stardust.placer
execute as @e[tag=stardust.destroyer] at @s run function stardust:destroy/all


#Materials
execute if data storage smithed.custom_block:main blockApi{id:"stardust:stardust_ore"} run function stardust:place/stardust_ore/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:awakened_stardust_ore"} run function stardust:place/awakened_stardust_ore/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:deepslate_stardust_ore"} run function stardust:place/deepslate_stardust_ore/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:nether_stardust_ore"} run function stardust:place/nether_stardust_ore/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:ender_stardust_ore"} run function stardust:place/ender_stardust_ore/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:stardust_block"} run function stardust:place/stardust_block/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:awakened_stardust_block"} run function stardust:place/awakened_stardust_block/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:legendarium_block"} run function stardust:place/legendarium_block/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:solarium_block"} run function stardust:place/solarium_block/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:darkium_block"} run function stardust:place/darkium_block/


#Compressed Cobblestones
execute if data storage smithed.custom_block:main blockApi{id:"stardust:compressed_cobblestone"} run function stardust:place/cobblestone/compressed/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:double_compressed_cobblestone"} run function stardust:place/cobblestone/double_compressed/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:triple_compressed_cobblestone"} run function stardust:place/cobblestone/triple_compressed/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:quadruple_compressed_cobblestone"} run function stardust:place/cobblestone/quadruple_compressed/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:quintuple_compressed_cobblestone"} run function stardust:place/cobblestone/quintuple_compressed/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:sextuple_compressed_cobblestone"} run function stardust:place/cobblestone/sextuple_compressed/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:septuple_compressed_cobblestone"} run function stardust:place/cobblestone/septuple_compressed/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:octuple_compressed_cobblestone"} run function stardust:place/cobblestone/octuple_compressed/


#Cobblestone Miners
execute if data storage smithed.custom_block:main blockApi{id:"stardust:cobblestone_miner_lv1"} run function stardust:place/cobblestone_miner/lv1/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:cobblestone_miner_lv2"} run function stardust:place/cobblestone_miner/lv2/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:cobblestone_miner_lv3"} run function stardust:place/cobblestone_miner/lv3/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:cobblestone_miner_lv4"} run function stardust:place/cobblestone_miner/lv4/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:cobblestone_miner_lv5"} run function stardust:place/cobblestone_miner/lv5/


#Quarries
execute if data storage smithed.custom_block:main blockApi{id:"stardust:quarry_lv1"} run function stardust:place/quarry/lv1/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:quarry_lv2"} run function stardust:place/quarry/lv2/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:quarry_lv3"} run function stardust:place/quarry/lv3/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:quarry_lv4"} run function stardust:place/quarry/lv4/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:quarry_lv5"} run function stardust:place/quarry/lv5/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:quarry_lv6"} run function stardust:place/quarry/lv6/


#Portals
execute if data storage smithed.custom_block:main blockApi{id:"stardust:cavern_portal"} run function stardust:place/cavern_portal/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:celestial_portal"} run function stardust:place/celestial_portal/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:stardust_portal"} run function stardust:place/stardust_portal/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:stardust_dungeon_portal"} run function stardust:place/stardust_dungeon_portal/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:ultimate_portal"} run function stardust:place/ultimate_portal/


#Others
execute if data storage smithed.custom_block:main blockApi{id:"stardust:emerald_spawner"} run function stardust:place/emerald_spawner/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:ultimate_spawner"} run function stardust:place/ultimate_spawner/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:life_crystal_block"} run function stardust:place/life_crystal/


#Machines
execute if data storage smithed.custom_block:main blockApi{id:"stardust:mob_grinder"} run function stardust:place/mob_grinder/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:elevator"} run function stardust:place/elevator/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:nether_star_generator"} run function stardust:place/nether_star_generator/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:redstone_generator"} run function stardust:place/redstone_generator/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:heat_generator"} run function stardust:place/heat_generator/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:wind_turbine"} run function stardust:place/wind_turbine/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:advanced_furnace_generator"} run function stardust:place/advanced_furnace_generator/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:stardust_furnace_generator"} run function stardust:place/stardust_furnace_generator/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:awakened_furnace_generator"} run function stardust:place/awakened_furnace_generator/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:stardust_solar_panel"} run function stardust:place/stardust_solar_panel/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:awakened_solar_panel"} run function stardust:place/awakened_solar_panel/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:legendarium_solar_panel"} run function stardust:place/legendarium_solar_panel/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:solarium_solar_panel"} run function stardust:place/solarium_solar_panel/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:darkium_solar_panel"} run function stardust:place/darkium_solar_panel/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:stardust_battery"} run function stardust:place/stardust_battery/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:awakened_stardust_battery"} run function stardust:place/awakened_stardust_battery/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:ultimate_battery"} run function stardust:place/ultimate_battery/
execute if data storage smithed.custom_block:main blockApi{id:"stardust:growth_accelerator"} run function stardust:place/growth_accelerator/


tag @s remove stardust.placer
