
#> stardust:custom_blocks/stardust_seed/is_fully_grown
#
# @executed	as @n[type=item,nbt={Item:{id:"minecraft:moss_carpet"}},distance=..1]
#
# @within	stardust:custom_blocks/stardust_seed/replace_item
#

# If fully grown, drop the loot table and kill the current entity (item)
execute if score #growth_time stardust.data matches 480.. as @p[gamemode=!spectator] run loot spawn ~ ~ ~ fish stardust:seeds/stardust_seed ~ ~ ~ mainhand
execute if score #growth_time stardust.data matches 480.. run kill @s

