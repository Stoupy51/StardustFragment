
#> stardust:custom_blocks/_groups/minecraft_deepslate
#
# @executed	as @e[type=item_display,tag=...,predicate=!stardust:check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/destroy
#

execute if score #total_compressed_cobblestone stardust.data matches 1.. if entity @s[tag=stardust.compressed_cobblestone] run function stardust:custom_blocks/compressed_cobblestone/destroy
execute if score #total_double_compressed_cobblestone stardust.data matches 1.. if entity @s[tag=stardust.double_compressed_cobblestone] run function stardust:custom_blocks/double_compressed_cobblestone/destroy
execute if score #total_triple_compressed_cobblestone stardust.data matches 1.. if entity @s[tag=stardust.triple_compressed_cobblestone] run function stardust:custom_blocks/triple_compressed_cobblestone/destroy
execute if score #total_quadruple_compressed_cobblestone stardust.data matches 1.. if entity @s[tag=stardust.quadruple_compressed_cobblestone] run function stardust:custom_blocks/quadruple_compressed_cobblestone/destroy

