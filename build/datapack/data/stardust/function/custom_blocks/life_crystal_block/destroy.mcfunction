
#> stardust:custom_blocks/life_crystal_block/destroy
#
# @executed	as @e[type=item_display,tag=stardust.custom_block,predicate=!stardust:advanced_check_vanilla_blocks] & at @s
#
# @within	stardust:custom_blocks/_groups/minecraft_glass
#

# Check if the player has silk touch in mainhand
scoreboard players set #is_silk_touch stardust.data 0
execute as @p[distance=..10,gamemode=!spectator] if data entity @s SelectedItem.components."minecraft:enchantments"."minecraft:silk_touch" run scoreboard players set #is_silk_touch stardust.data 1

# If no item found, summon it
execute unless entity @n[type=item,nbt={Item:{id:"minecraft:glass"}},distance=..1] run loot spawn ~ ~ ~ loot {pools:[{entries:[{type:"minecraft:item",name:"minecraft:glass"}],rolls:1}]}

# Replace the item with the custom one
execute as @n[type=item,nbt={Item:{id:"minecraft:glass"}},distance=..1] run function stardust:custom_blocks/life_crystal_block/replace_item

# Decrease count scores
scoreboard players remove #total_custom_blocks stardust.data 1
scoreboard players remove #total_vanilla_glass stardust.data 1
scoreboard players remove #total_life_crystal_block stardust.data 1

# Kill the custom block entity
kill @s

