
#> stardust:mobs/stardust_bat/convert
#
# @executed	at @s
#
# @within	stardust:mobs/convert/stardust
#			stardust:mobs/stardust_bat/summon
#

# Make invisible, reset nbt, set custom name and tags
effect give @s invisibility infinite 255 true

# Add tags
tag @s add smithed.entity
tag @s add global.ignore
tag @s add stardust.stardust_bat
tag @s add stardust.mob_entity

# Set attributes (x2 health, x3 damage, x1.25 speed)
attribute @s minecraft:max_health modifier add stardust:health_scale 1 add_multiplied_base
attribute @s minecraft:attack_damage modifier add stardust:damage_scale 2 add_multiplied_base
attribute @s minecraft:movement_speed modifier add stardust:speed_scale 0.25 add_multiplied_base
data modify entity @s Health set value 2048.0f

# No equipment and set loot table
item replace entity @s weapon.mainhand with stone[item_model="minecraft:air",custom_data={"common_signals":{"temp":true}}]
item replace entity @s armor.head with air
item replace entity @s armor.chest with air
item replace entity @s armor.legs with air
item replace entity @s armor.feet with air
data modify entity @s DeathLootTable set value "stardust:entities/stardust_bat"

# Set custom name and other properties
data modify entity @s CustomName set value {"translate": "stardust_bat","color":"aqua"}
data modify entity @s CanPickUpLoot set value false

# Create visual model
execute store result score #base_scale stardust.data run attribute @s minecraft:scale base get 1000
tag @s add stardust.new_mob
execute summon item_display run function stardust:mobs/create_model {"entity":"stardust_bat"}
tag @s remove stardust.new_mob

