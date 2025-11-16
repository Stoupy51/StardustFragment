
#> stardust:advancements/consume_stoupegg
#
# @executed	as the player & at current position
#
# @within	advancement stardust:technical/consume_stoupegg
#

# Revoke advancement
advancement revoke @s only stardust:technical/consume_stoupegg

# Tellraw, playsound, and particles
tellraw @a[distance=..128] ["",[{"text": "[", "color": "dark_aqua"}, [{"text": "S", "color": "#198534", "italic": false}, {"text": "t", "color": "#19863a"}, {"text": "a", "color": "#1a8841"}, {"text": "r", "color": "#1b8948"}, {"text": "d", "color": "#1b8b4e"}, {"text": "u", "color": "#1c8c55"}, {"text": "s", "color": "#1d8e5c"}, {"text": "t", "color": "#1d8f62"}, {"text": " ", "color": "#1e9169"}, {"text": "F", "color": "#1f9270"}, {"text": "r", "color": "#1f9476"}, {"text": "a", "color": "#20957d"}, {"text": "g", "color": "#219784"}, {"text": "m", "color": "#21988a"}, {"text": "e", "color": "#229a91"}, {"text": "n", "color": "#239b98"}, {"text": "t", "color": "#249d9f"}], {"text": "]", "color": "dark_aqua"}],{"text":" A "},[{"text": "S", "color": "#743d2b", "italic": false}, {"text": "t", "color": "#7d4531"}, {"text": "o", "color": "#864d37"}, {"text": "u", "color": "#8f563d"}, {"text": "p", "color": "#985e43"}, {"text": " ", "color": "#a1664a"}, {"text": "A", "color": "#aa6f50"}, {"text": "r", "color": "#b37756"}, {"text": "m", "color": "#bc7f5c"}, {"text": "y", "color": "#c68863"}],{"translate": "stardust.has_been_summoned"}]
execute as @a[distance=..128] at @s run playsound stardust:wolf_howl ambient @s
particle minecraft:enchant ~ ~ ~ 0.5 0.5 0.5 0.5 500

# Summon Stoupy at world surface
execute positioned over world_surface run function stardust:mobs/stoupy/summon

# Summon 5 waves of ally wolves
execute positioned over world_surface run function stardust:mobs/stoupy/summon_wave
execute positioned over world_surface run function stardust:mobs/stoupy/summon_wave
execute positioned over world_surface run function stardust:mobs/stoupy/summon_wave
execute positioned over world_surface run function stardust:mobs/stoupy/summon_wave
execute positioned over world_surface run function stardust:mobs/stoupy/summon_wave

