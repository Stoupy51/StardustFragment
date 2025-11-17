
#> stardust:mobs/ultimate_dragon/convert
#
# @executed	as @e[tag=stardust.ultimate_dragon_essence_landed] & at @s
#
# @within	stardust:mobs/ultimate_dragon/summon
#

# Add tags & join team
tag @s add smithed.entity
tag @s add global.ignore
tag @s add stardust.ultimate_dragon
tag @s add stardust.mob_entity
team join stardust.mob @s

# Mark as new mob for setup
tag @s add stardust.new_mob

# Set attributes (2048 health, x4 damage, 80% resistance)
attribute @s minecraft:max_health base set 2048
attribute @s minecraft:attack_damage modifier add stardust:damage_scale 3 add_multiplied_base
effect give @s minecraft:resistance infinite 3 true
data modify entity @s Health set value 4096.0f

# Set custom name and other properties
data modify entity @s CustomName set value {"translate": "stardust.ultimate_dragon","color":"white"}
data modify entity @s PersistenceRequired set value true

# Create visual model
scoreboard players set #base_scale stardust.data 0
execute summon item_display run function stardust:mobs/create_model {"entity":"ultimate_dragon"}

# Setup bossbar
bossbar set stardust:ultimate_dragon name [{"text": "U", "color": "#ff0000", "italic": false}, {"text": "l", "color": "#ff6600"}, {"text": "t", "color": "#ffcc00"}, {"text": "i", "color": "#ccff00"}, {"text": "m", "color": "#65ff00"}, {"text": "a", "color": "#00ff00"}, {"text": "t", "color": "#00ff65"}, {"text": "e", "color": "#00ffcb"}, {"text": " ", "color": "#00cbff"}, {"text": "D", "color": "#0065ff"}, {"text": "r", "color": "#0000ff"}, {"text": "a", "color": "#6600ff"}, {"text": "g", "color": "#cb00ff"}, {"text": "o", "color": "#ff00cb"}, {"text": "n", "color": "#ff0066"}]
bossbar set stardust:ultimate_dragon value 2048

# Remove new_mob tag after setup
tag @s remove stardust.new_mob

