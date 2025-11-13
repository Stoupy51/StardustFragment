
#> stardust:mobs/stardust_pillar/convert
#
# @within	stardust:mobs/stardust_pillar/summon
#

# Make invisible, reset nbt, set custom name and tags
effect give @s invisibility infinite 255 true

# Add tags
tag @s add smithed.entity
tag @s add global.ignore
tag @s add stardust.stardust_pillar
tag @s add stardust.mob_entity

# No equipment or loot table
item replace entity @s weapon.mainhand with stone[item_model="minecraft:air",custom_data={"common_signals":{"temp":true}}]
data modify entity @s DeathLootTable set value "none"

# Set attributes (500 health, x2 damage, 5x scale)
attribute @s minecraft:attack_damage modifier add stardust:damage_scale 2 add_multiplied_base
attribute @s minecraft:max_health base set 500
attribute @s minecraft:scale base set 5.0
data modify entity @s Health set value 2048.0f

# Set custom name and other properties
data modify entity @s CustomName set value {"translate": "stardust_pillar","color":"aqua"}
data modify entity @s PersistenceRequired set value true
data modify entity @s Silent set value true

# Create visual model
execute store result score #base_scale stardust.data run attribute @s minecraft:scale base get 500
tag @s add stardust.new_mob
execute summon item_display run function stardust:mobs/create_model {"entity":"stardust_pillar"}
tag @s remove stardust.new_mob

