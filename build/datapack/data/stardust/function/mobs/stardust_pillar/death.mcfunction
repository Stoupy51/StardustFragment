
#> stardust:mobs/stardust_pillar/death
#
# @executed	as @e[type=item_display,tag=...] & at @s
#
# @within	stardust:mobs/display/start_dying
#

# Remove bossbar (from all players)
bossbar set stardust:stardust_pillar players

# Reward nearby players
loot give @a[distance=..96] loot stardust:entities/stardust_pillar

# Tellraw and playsound	# TODO: Add sound
tellraw @a[distance=..96] ["",[{"text": "[", "color": "dark_aqua"}, [{"text": "S", "color": "#198534", "italic": false}, {"text": "t", "color": "#19863a"}, {"text": "a", "color": "#1a8841"}, {"text": "r", "color": "#1b8948"}, {"text": "d", "color": "#1b8b4e"}, {"text": "u", "color": "#1c8c55"}, {"text": "s", "color": "#1d8e5c"}, {"text": "t", "color": "#1d8f62"}, {"text": " ", "color": "#1e9169"}, {"text": "F", "color": "#1f9270"}, {"text": "r", "color": "#1f9476"}, {"text": "a", "color": "#20957d"}, {"text": "g", "color": "#219784"}, {"text": "m", "color": "#21988a"}, {"text": "e", "color": "#229a91"}, {"text": "n", "color": "#239b98"}, {"text": "t", "color": "#249d9f"}], {"text": "]", "color": "dark_aqua"}],{"translate": "stardust.the"},[{"text": "S", "color": "#198534", "italic": false}, {"text": "t", "color": "#198537"}, {"text": "a", "color": "#19863b"}, {"text": "r", "color": "#1a873e"}, {"text": "d", "color": "#1a8842"}, {"text": "u", "color": "#1a8945"}, {"text": "s", "color": "#1b8949"}, {"text": "t", "color": "#1b8a4c"}, {"text": " ", "color": "#1b8b50"}, {"text": "P", "color": "#1c8c54"}, {"text": "i", "color": "#1c8d57"}, {"text": "l", "color": "#1d8d5b"}, {"text": "l", "color": "#1d8e5e"}, {"text": "a", "color": "#1d8f62"}, {"text": "r", "color": "#1e9065"}],{"translate": "stardust.has_been_defeated"}]
playsound minecraft:entity.wither.death hostile @a[distance=..96]

