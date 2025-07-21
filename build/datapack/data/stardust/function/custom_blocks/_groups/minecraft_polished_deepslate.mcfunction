
#> stardust:custom_blocks/_groups/minecraft_polished_deepslate
#
# @within	stardust:custom_blocks/destroy
#

execute if score #total_awakened_stardust_ore stardust.data matches 1.. if entity @s[tag=stardust.awakened_stardust_ore] run function stardust:custom_blocks/awakened_stardust_ore/destroy
execute if score #total_stardust_ore stardust.data matches 1.. if entity @s[tag=stardust.stardust_ore] run function stardust:custom_blocks/stardust_ore/destroy
execute if score #total_deepslate_stardust_ore stardust.data matches 1.. if entity @s[tag=stardust.deepslate_stardust_ore] run function stardust:custom_blocks/deepslate_stardust_ore/destroy
execute if score #total_nether_stardust_ore stardust.data matches 1.. if entity @s[tag=stardust.nether_stardust_ore] run function stardust:custom_blocks/nether_stardust_ore/destroy
execute if score #total_ender_stardust_ore stardust.data matches 1.. if entity @s[tag=stardust.ender_stardust_ore] run function stardust:custom_blocks/ender_stardust_ore/destroy

