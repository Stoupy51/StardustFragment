
#> stardust:mobs/ultimate_dragon/essence/finish_animation
#
# @executed	as @e[tag=stardust.ultimate_dragon_essence_landed] & at @s
#
# @within	stardust:mobs/ultimate_dragon/essence/check_reached_max_size
#

# Remove entity
kill @s

# Tellraw, playsound, and particles
tellraw @a[distance=..128] ["",[{"text": "[", "color": "dark_aqua"}, [{"text": "S", "color": "#198534", "italic": false}, {"text": "t", "color": "#19863a"}, {"text": "a", "color": "#1a8841"}, {"text": "r", "color": "#1b8948"}, {"text": "d", "color": "#1b8b4e"}, {"text": "u", "color": "#1c8c55"}, {"text": "s", "color": "#1d8e5c"}, {"text": "t", "color": "#1d8f62"}, {"text": " ", "color": "#1e9169"}, {"text": "F", "color": "#1f9270"}, {"text": "r", "color": "#1f9476"}, {"text": "a", "color": "#20957d"}, {"text": "g", "color": "#219784"}, {"text": "m", "color": "#21988a"}, {"text": "e", "color": "#229a91"}, {"text": "n", "color": "#239b98"}, {"text": "t", "color": "#249d9f"}], {"text": "]", "color": "dark_aqua"}],{"text":" An "},[{"text": "U", "color": "#ff0000", "italic": false}, {"text": "l", "color": "#ff6600"}, {"text": "t", "color": "#ffcc00"}, {"text": "i", "color": "#ccff00"}, {"text": "m", "color": "#65ff00"}, {"text": "a", "color": "#00ff00"}, {"text": "t", "color": "#00ff65"}, {"text": "e", "color": "#00ffcb"}, {"text": " ", "color": "#00cbff"}, {"text": "D", "color": "#0065ff"}, {"text": "r", "color": "#0000ff"}, {"text": "a", "color": "#6600ff"}, {"text": "g", "color": "#cb00ff"}, {"text": "o", "color": "#ff00cb"}, {"text": "n", "color": "#ff0066"}],{"translate": "stardust.has_been_summoned"}]
execute as @a[distance=..128] at @s run playsound minecraft:entity.ender_dragon.ambient ambient @s
execute as @a[distance=..128] at @s run playsound minecraft:entity.dragon_fireball.explode ambient @s
particle minecraft:dragon_breath ~ ~ ~ 10 10 10 0.5 5000
particle minecraft:explosion_emitter ~ ~ ~ 4 4 4 0.0 10

# Summon Ultimate Dragon at world surface
function stardust:mobs/ultimate_dragon/summon

# Summon 3 slaves
execute positioned ~10 ~ ~ run function stardust:mobs/ultimate_slave/summon
execute positioned ~ ~ ~7 run function stardust:mobs/ultimate_slave/summon
execute positioned ~ ~ ~-7 run function stardust:mobs/ultimate_slave/summon

