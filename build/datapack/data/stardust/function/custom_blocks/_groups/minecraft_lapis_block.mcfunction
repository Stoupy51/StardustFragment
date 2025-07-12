
#> stardust:custom_blocks/_groups/minecraft_lapis_block
#
# @within	stardust:custom_blocks/destroy
#

execute if score #total_stardust_block stardust.data matches 1.. if entity @s[tag=stardust.stardust_block] run function stardust:custom_blocks/stardust_block/destroy

