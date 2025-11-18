
#> stardust:mobs/ultimate_slave/convert
#
# @executed	positioned ~10 ~ ~
#
# @within	stardust:mobs/ultimate_slave/summon
#

# Add tags & join team
tag @s add smithed.entity
tag @s add global.ignore
tag @s add stardust.ultimate_slave
tag @s add stardust.ultimate_boss
tag @s add stardust.mob_entity
team join stardust.mob @s

# Mark as new mob for setup
tag @s add stardust.new_mob

# Set attributes (512 health, x4 damage)
attribute @s minecraft:max_health base set 512
attribute @s minecraft:attack_damage modifier add stardust:damage_scale 3 add_multiplied_base
data modify entity @s Health set value 4096.0f

# Set custom name and other properties
data modify entity @s CustomName set value {"translate": "stardust.ultimate_slave","color":"white"}
data modify entity @s PersistenceRequired set value true

# Create visual model
scoreboard players set #base_scale stardust.data 0
execute summon item_display run function stardust:mobs/create_model {"entity":"ultimate_slave"}

# Remove new_mob tag after setup
tag @s remove stardust.new_mob

