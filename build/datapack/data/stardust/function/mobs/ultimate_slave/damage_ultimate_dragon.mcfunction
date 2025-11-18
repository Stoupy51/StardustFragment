
#> stardust:mobs/ultimate_slave/damage_ultimate_dragon
#
# @executed	as @e[tag=...] & at @s
#
# @within	stardust:mobs/ultimate_slave/check_health [ as @e[tag=...] & at @s ]
#

# Remove 25% of total health
execute store result score #to_remove stardust.data run attribute @s minecraft:max_health get 250
execute store result score #current_health stardust.data run data get entity @s Health 1000
scoreboard players operation #current_health stardust.data -= #to_remove stardust.data
execute if score #current_health stardust.data matches 1.. store result entity @s Health float 0.001 run scoreboard players get #current_health stardust.data
execute if score #current_health stardust.data matches ..0 run data modify entity @s Health set value 10.0f

# Resummon end crystals
function stardust:mobs/ultimate_dragon/summon_end_crystals

# Particle, playsound, and tellraw
execute as @a[distance=..200] at @s run playsound minecraft:entity.dragon_fireball.explode hostile @s
particle soul ~ ~ ~ 10 10 10 0.5 1000 force @a[distance=..200]
tellraw @a[distance=..200] ["",[{"text": "[", "color": "dark_aqua"}, [{"text": "S", "color": "#198534", "italic": false}, {"text": "t", "color": "#19863a"}, {"text": "a", "color": "#1a8841"}, {"text": "r", "color": "#1b8948"}, {"text": "d", "color": "#1b8b4e"}, {"text": "u", "color": "#1c8c55"}, {"text": "s", "color": "#1d8e5c"}, {"text": "t", "color": "#1d8f62"}, {"text": " ", "color": "#1e9169"}, {"text": "F", "color": "#1f9270"}, {"text": "r", "color": "#1f9476"}, {"text": "a", "color": "#20957d"}, {"text": "g", "color": "#219784"}, {"text": "m", "color": "#21988a"}, {"text": "e", "color": "#229a91"}, {"text": "n", "color": "#239b98"}, {"text": "t", "color": "#249d9f"}], {"text": "]", "color": "dark_aqua"}],{"translate": "stardust.one_of_the_slaves_has_been_defeated_the"},[{"text": "U", "color": "#ff0000", "italic": false}, {"text": "l", "color": "#ff6600"}, {"text": "t", "color": "#ffcc00"}, {"text": "i", "color": "#ccff00"}, {"text": "m", "color": "#65ff00"}, {"text": "a", "color": "#00ff00"}, {"text": "t", "color": "#00ff65"}, {"text": "e", "color": "#00ffcb"}, {"text": " ", "color": "#00cbff"}, {"text": "D", "color": "#0065ff"}, {"text": "r", "color": "#0000ff"}, {"text": "a", "color": "#6600ff"}, {"text": "g", "color": "#cb00ff"}, {"text": "o", "color": "#ff00cb"}, {"text": "n", "color": "#ff0066"}],{"translate": "stardust.just_lost_25_of_its_max_health"}]

