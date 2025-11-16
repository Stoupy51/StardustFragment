
#> stardust:mobs/stoupy/convert
#
# @executed	positioned over world_surface run
#
# @within	stardust:mobs/stoupy/summon
#

# Modify wolf type
data modify entity @s variant set value "minecraft:woods"

# Add tags & join team
tag @s add smithed.entity
tag @s add global.ignore
tag @s add stardust.stoupy
tag @s add stardust.mob_entity
tag @s add stardust.update_health
team join stardust.mob @s

# Mark as new mob for setup
tag @s add stardust.new_mob

# Wolf armor and loot table
item replace entity @s armor.feet with minecraft:stone[equippable={"slot":"feet"},attribute_modifiers=[{"type":"minecraft:max_health","amount":250,"id":"stardust:armor.body","operation":"add_value","slot":"feet"}],custom_data={"common_signals":{"temp":true}}]
data modify entity @s DeathLootTable set value "stardust:entities/stoupy"

# Set attributes (x2 damage, 0.9x scale, 10 knockback resistance)
attribute @s minecraft:attack_damage modifier add stardust:damage_scale 1 add_multiplied_base
attribute @s minecraft:scale base set 0.9
attribute @s minecraft:knockback_resistance base set 10.0
effect give @s minecraft:regeneration 5 255 true

# Set custom name and other properties
data modify entity @s CustomName set value {"translate": "stardust.stoupy","color":"white"}
data modify entity @s PersistenceRequired set value true

# Create visual model
scoreboard players set #base_scale stardust.data 0
execute summon item_display run function stardust:mobs/create_model {"entity":"stoupy"}

# Setup bossbar
bossbar set stardust:stoup_army name [{"text": "S", "color": "#743d2b", "italic": false}, {"text": "t", "color": "#7d4531"}, {"text": "o", "color": "#864d37"}, {"text": "u", "color": "#8f563d"}, {"text": "p", "color": "#985e43"}, {"text": " ", "color": "#a1664a"}, {"text": "A", "color": "#aa6f50"}, {"text": "r", "color": "#b37756"}, {"text": "m", "color": "#bc7f5c"}, {"text": "y", "color": "#c68863"}]
bossbar set stardust:stoup_army value 250

# Remove new_mob tag after setup
tag @s remove stardust.new_mob

