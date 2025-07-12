
#> stardust:custom_blocks/_groups/minecraft_redstone_block
#
# @within	stardust:custom_blocks/destroy
#

execute if score #total_awakened_stardust_block stardust.data matches 1.. if entity @s[tag=stardust.awakened_stardust_block] run function stardust:custom_blocks/awakened_stardust_block/destroy

