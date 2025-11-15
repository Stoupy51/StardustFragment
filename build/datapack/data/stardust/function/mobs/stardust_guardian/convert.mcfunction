
#> stardust:mobs/stardust_guardian/convert
#
# @executed	positioned 68.0 169.69 -31
#
# @within	stardust:mobs/stardust_guardian/summon
#

# Make invisible, reset nbt, set custom name and tags
effect give @s invisibility infinite 255 true

# Add tags & join team
tag @s add smithed.entity
tag @s add global.ignore
tag @s add stardust.stardust_guardian
tag @s add stardust.mob_entity
team join stardust.mob @s

# Mark as new mob for setup
tag @s add stardust.new_mob

# No equipment or loot table
item replace entity @s weapon.mainhand with stone[item_model="minecraft:air",custom_data={"common_signals":{"temp":true}}]
data modify entity @s DeathLootTable set value "none"

# Set attributes (1024 health, x3 damage, 2x scale, 10 knockback resistance)
attribute @s minecraft:attack_damage modifier add stardust:damage_scale 2 add_multiplied_base
attribute @s minecraft:max_health base set 1024
attribute @s minecraft:scale base set 1.5
attribute @s minecraft:knockback_resistance base set 10.0
data modify entity @s Health set value 2048.0f

# Set custom name and other properties
data modify entity @s CustomName set value {"translate": "stardust_guardian","color":"red"}
data modify entity @s PersistenceRequired set value true
data modify entity @s Silent set value true

# Create visual model
execute store result score #base_scale stardust.data run attribute @s minecraft:scale base get 1000
execute summon item_display run function stardust:mobs/create_model {"entity":"stardust_guardian"}

# Playsound on summon #TODO: Add the sound
execute as @a[distance=..200] at @s facing entity @n[tag=stardust.new_mob] eyes run playsound stardust:stardust_guardian_spawn hostile @s ^ ^ ^5

# Setup bossbar
bossbar set stardust:stardust_guardian name [{"text": "S", "color": "#8b0000", "italic": false}, {"text": "t", "color": "#8d0006"}, {"text": "a", "color": "#90000c"}, {"text": "r", "color": "#920113"}, {"text": "d", "color": "#950119"}, {"text": "u", "color": "#98011f"}, {"text": "s", "color": "#9a0226"}, {"text": "t", "color": "#9d022c"}, {"text": " ", "color": "#a00333"}, {"text": "G", "color": "#a20339"}, {"text": "u", "color": "#a5033f"}, {"text": "a", "color": "#a70446"}, {"text": "r", "color": "#aa044c"}, {"text": "d", "color": "#ad0452"}, {"text": "i", "color": "#af0559"}, {"text": "a", "color": "#b2055f"}, {"text": "n", "color": "#b50666"}]
bossbar set stardust:stardust_guardian value 1024

# Remove new_mob tag after setup
tag @s remove stardust.new_mob

