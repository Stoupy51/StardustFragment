
#> stardust:custom_blocks/_groups/minecraft_obsidian
#
# @executed	as @e[type=item_display,tag=...,predicate=!stardust:check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/destroy
#

execute if score #total_octuple_compressed_cobblestone stardust.data matches 1.. if entity @s[tag=stardust.octuple_compressed_cobblestone] run function stardust:custom_blocks/octuple_compressed_cobblestone/destroy
execute if score #total_quintuple_compressed_cobblestone stardust.data matches 1.. if entity @s[tag=stardust.quintuple_compressed_cobblestone] run function stardust:custom_blocks/quintuple_compressed_cobblestone/destroy
execute if score #total_septuple_compressed_cobblestone stardust.data matches 1.. if entity @s[tag=stardust.septuple_compressed_cobblestone] run function stardust:custom_blocks/septuple_compressed_cobblestone/destroy
execute if score #total_sextuple_compressed_cobblestone stardust.data matches 1.. if entity @s[tag=stardust.sextuple_compressed_cobblestone] run function stardust:custom_blocks/sextuple_compressed_cobblestone/destroy

