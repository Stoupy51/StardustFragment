
#> stardust:mobs/stardust_guardian/death
#
# @executed	as @e[type=item_display,tag=...] & at @s
#
# @within	stardust:mobs/display/start_dying
#

# Remove bossbar (from all players)
bossbar set stardust:stardust_guardian players

# Reward nearby players
loot give @a[distance=..50] loot stardust:entities/stardust_guardian

# Tellraw and playsound	# TODO: Add sound
tellraw @a[distance=..50] ["",[{"text": "[", "color": "dark_aqua"}, [{"text": "S", "color": "#198534", "italic": false}, {"text": "t", "color": "#19863a"}, {"text": "a", "color": "#1a8841"}, {"text": "r", "color": "#1b8948"}, {"text": "d", "color": "#1b8b4e"}, {"text": "u", "color": "#1c8c55"}, {"text": "s", "color": "#1d8e5c"}, {"text": "t", "color": "#1d8f62"}, {"text": " ", "color": "#1e9169"}, {"text": "F", "color": "#1f9270"}, {"text": "r", "color": "#1f9476"}, {"text": "a", "color": "#20957d"}, {"text": "g", "color": "#219784"}, {"text": "m", "color": "#21988a"}, {"text": "e", "color": "#229a91"}, {"text": "n", "color": "#239b98"}, {"text": "t", "color": "#249d9f"}], {"text": "]", "color": "dark_aqua"}],{"translate": "stardust.the"},[{"text": "S", "color": "#8b0000", "italic": false}, {"text": "t", "color": "#8d0006"}, {"text": "a", "color": "#90000c"}, {"text": "r", "color": "#920113"}, {"text": "d", "color": "#950119"}, {"text": "u", "color": "#98011f"}, {"text": "s", "color": "#9a0226"}, {"text": "t", "color": "#9d022c"}, {"text": " ", "color": "#a00333"}, {"text": "G", "color": "#a20339"}, {"text": "u", "color": "#a5033f"}, {"text": "a", "color": "#a70446"}, {"text": "r", "color": "#aa044c"}, {"text": "d", "color": "#ad0452"}, {"text": "i", "color": "#af0559"}, {"text": "a", "color": "#b2055f"}, {"text": "n", "color": "#b50666"}],{"translate": "stardust.has_been_defeated"}]
playsound minecraft:entity.wither.death hostile @a[distance=..50]

