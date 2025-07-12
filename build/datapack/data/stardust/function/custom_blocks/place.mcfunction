
#> stardust:custom_blocks/place
#
# @within	stardust:custom_blocks/on_place
#

tag @s add stardust.placer
execute if data storage smithed.custom_block:main blockApi{id:"stardust:stardust_block"} run function stardust:custom_blocks/stardust_block/place_main
execute if data storage smithed.custom_block:main blockApi{id:"stardust:stardust_ore"} run function stardust:custom_blocks/stardust_ore/place_main
execute if data storage smithed.custom_block:main blockApi{id:"stardust:deepslate_stardust_ore"} run function stardust:custom_blocks/deepslate_stardust_ore/place_main
execute if data storage smithed.custom_block:main blockApi{id:"stardust:legendarium_block"} run function stardust:custom_blocks/legendarium_block/place_main
execute if data storage smithed.custom_block:main blockApi{id:"stardust:solarium_block"} run function stardust:custom_blocks/solarium_block/place_main
execute if data storage smithed.custom_block:main blockApi{id:"stardust:darkium_block"} run function stardust:custom_blocks/darkium_block/place_main
execute if data storage smithed.custom_block:main blockApi{id:"stardust:awakened_stardust_block"} run function stardust:custom_blocks/awakened_stardust_block/place_main
execute if data storage smithed.custom_block:main blockApi{id:"stardust:nether_stardust_ore"} run function stardust:custom_blocks/nether_stardust_ore/place_main
execute if data storage smithed.custom_block:main blockApi{id:"stardust:ender_stardust_ore"} run function stardust:custom_blocks/ender_stardust_ore/place_main
execute if data storage smithed.custom_block:main blockApi{id:"stardust:compressed_cobblestone"} run function stardust:custom_blocks/compressed_cobblestone/place_main
execute if data storage smithed.custom_block:main blockApi{id:"stardust:double_compressed_cobblestone"} run function stardust:custom_blocks/double_compressed_cobblestone/place_main
execute if data storage smithed.custom_block:main blockApi{id:"stardust:triple_compressed_cobblestone"} run function stardust:custom_blocks/triple_compressed_cobblestone/place_main
execute if data storage smithed.custom_block:main blockApi{id:"stardust:stardust_battery"} run function stardust:custom_blocks/stardust_battery/place_main
execute if data storage smithed.custom_block:main blockApi{id:"stardust:awakened_stardust_battery"} run function stardust:custom_blocks/awakened_stardust_battery/place_main
execute if data storage smithed.custom_block:main blockApi{id:"stardust:stardust_solar_panel"} run function stardust:custom_blocks/stardust_solar_panel/place_main
execute if data storage smithed.custom_block:main blockApi{id:"stardust:awakened_solar_panel"} run function stardust:custom_blocks/awakened_solar_panel/place_main
execute if data storage smithed.custom_block:main blockApi{id:"stardust:growth_accelerator"} run function stardust:custom_blocks/growth_accelerator/place_main
tag @s remove stardust.placer

