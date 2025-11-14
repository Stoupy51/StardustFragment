
#> stardust:mobs/stardust_pillar/remove_shield
#
# @executed	at @s
#
# @within	stardust:mobs/stardust_pillar/second
#

# Remove NoAI to allow movement, and clear resistance effect
data modify entity @s NoAI set value false
effect clear @s minecraft:resistance

# Update bossbar text
bossbar set stardust:stardust_pillar name [{"text": "S", "color": "#198534", "italic": false}, {"text": "t", "color": "#198537"}, {"text": "a", "color": "#19863b"}, {"text": "r", "color": "#1a873e"}, {"text": "d", "color": "#1a8842"}, {"text": "u", "color": "#1a8945"}, {"text": "s", "color": "#1b8949"}, {"text": "t", "color": "#1b8a4c"}, {"text": " ", "color": "#1b8b50"}, {"text": "P", "color": "#1c8c54"}, {"text": "i", "color": "#1c8d57"}, {"text": "l", "color": "#1d8d5b"}, {"text": "l", "color": "#1d8e5e"}, {"text": "a", "color": "#1d8f62"}, {"text": "r", "color": "#1e9065"}]

# Playsound on shield break #TODO: Add the sound
tag @s add stardust.temp
execute as @a[distance=..200] at @s facing entity @n[tag=stardust.temp] eyes run playsound minecraft:entity.warden.sonic_boom hostile @s ^ ^ ^5
tag @s remove stardust.temp

# Particle effect
particle minecraft:sculk_soul ~ ~ ~ 0.5 0.5 0.5 0.5 500

