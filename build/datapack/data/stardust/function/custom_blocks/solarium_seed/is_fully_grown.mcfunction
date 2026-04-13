
#> stardust:custom_blocks/solarium_seed/is_fully_grown
#
# @executed	as @n[type=item,nbt={Item:{id:"minecraft:moss_carpet"}},distance=..1]
#
# @within	stardust:custom_blocks/solarium_seed/replace_item
#

# If fully grown, drop the loot table and kill the current entity (item)
execute if score #growth_time stardust.data matches 3840.. as @p[gamemode=!spectator] run loot spawn ~ ~ ~ fish stardust:seeds/solarium_seed ~ ~ ~ mainhand
execute if score #growth_time stardust.data matches 3840.. run kill @s

