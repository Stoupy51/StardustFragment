
#> stardust:mobs/stardust_pillar/convert
#
# @within	stardust:mobs/stardust_pillar/summon
#

# Make invisible, reset nbt, set custom name and tags
effect give @s invisibility infinite 255 true

# Add tags & join team
tag @s add smithed.entity
tag @s add global.ignore
tag @s add stardust.stardust_pillar
tag @s add stardust.mob_entity
team join stardust.mob @s

# Mark as new mob for setup
tag @s add stardust.new_mob

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
data modify entity @s NoAI set value true

# Create visual model
execute store result score #base_scale stardust.data run attribute @s minecraft:scale base get 500
execute summon item_display run function stardust:mobs/create_model {"entity":"stardust_pillar"}

# Playsound on summon #TODO: Add the sound
execute as @a[distance=..200] at @s facing entity @n[tag=stardust.new_mob] eyes run playsound stardust:stardust_pillar_spawn hostile @s ^ ^ ^5

# Setup bossbar
bossbar set stardust:stardust_pillar name [{"text": "S", "color": "#198534", "italic": false}, {"text": "t", "color": "#198537"}, {"text": "a", "color": "#19863b"}, {"text": "r", "color": "#1a873e"}, {"text": "d", "color": "#1a8842"}, {"text": "u", "color": "#1a8945"}, {"text": "s", "color": "#1b8949"}, {"text": "t", "color": "#1b8a4c"}, {"text": " ", "color": "#1b8b50"}, {"text": "P", "color": "#1c8c54"}, {"text": "i", "color": "#1c8d57"}, {"text": "l", "color": "#1d8d5b"}, {"text": "l", "color": "#1d8e5e"}, {"text": "a", "color": "#1d8f62"}, {"text": "r", "color": "#1e9065"}, {"text": " ", "color": "#1e9169"}, {"text": "(", "color": "#1e916d"}, {"text": "A", "color": "#1f9270"}, {"text": "c", "color": "#1f9374"}, {"text": "t", "color": "#1f9477"}, {"text": "i", "color": "#20957b"}, {"text": "v", "color": "#20957e"}, {"text": "e", "color": "#219682"}, {"text": " ", "color": "#219786"}, {"text": "S", "color": "#219889"}, {"text": "h", "color": "#22998d"}, {"text": "i", "color": "#229990"}, {"text": "e", "color": "#229a94"}, {"text": "l", "color": "#239b97"}, {"text": "d", "color": "#239c9b"}, {"text": ")", "color": "#249d9f"}]
bossbar set stardust:stardust_pillar value 500

# Remove new_mob tag after setup
tag @s remove stardust.new_mob

