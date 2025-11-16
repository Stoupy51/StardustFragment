
#> stardust:advancements/consume_starlight_infuser
#
# @executed	as the player & at current position
#
# @within	advancement stardust:technical/consume_starlight_infuser
#

# Revoke advancement
advancement revoke @s only stardust:technical/consume_starlight_infuser

# Tellraw, playsound, and particles
tellraw @a[distance=..128] ["",[{"text": "[", "color": "dark_aqua"}, [{"text": "S", "color": "#198534", "italic": false}, {"text": "t", "color": "#19863a"}, {"text": "a", "color": "#1a8841"}, {"text": "r", "color": "#1b8948"}, {"text": "d", "color": "#1b8b4e"}, {"text": "u", "color": "#1c8c55"}, {"text": "s", "color": "#1d8e5c"}, {"text": "t", "color": "#1d8f62"}, {"text": " ", "color": "#1e9169"}, {"text": "F", "color": "#1f9270"}, {"text": "r", "color": "#1f9476"}, {"text": "a", "color": "#20957d"}, {"text": "g", "color": "#219784"}, {"text": "m", "color": "#21988a"}, {"text": "e", "color": "#229a91"}, {"text": "n", "color": "#239b98"}, {"text": "t", "color": "#249d9f"}], {"text": "]", "color": "dark_aqua"}],{"text":" A "},[{"text": "S", "color": "#198534", "italic": false}, {"text": "t", "color": "#198537"}, {"text": "a", "color": "#19863b"}, {"text": "r", "color": "#1a873e"}, {"text": "d", "color": "#1a8842"}, {"text": "u", "color": "#1a8945"}, {"text": "s", "color": "#1b8949"}, {"text": "t", "color": "#1b8a4c"}, {"text": " ", "color": "#1b8b50"}, {"text": "P", "color": "#1c8c54"}, {"text": "i", "color": "#1c8d57"}, {"text": "l", "color": "#1d8d5b"}, {"text": "l", "color": "#1d8e5e"}, {"text": "a", "color": "#1d8f62"}, {"text": "r", "color": "#1e9065"}],{"translate": "stardust.has_been_summoned"}]
execute as @a[distance=..128] at @s run playsound minecraft:entity.wither.spawn ambient @s
particle minecraft:sculk_soul ~ ~ ~ 0.5 0.5 0.5 0.5 500

# Summon Stardust Pillar at world surface + 15
execute positioned over world_surface positioned ~ ~15 ~ run function stardust:mobs/stardust_pillar/summon

