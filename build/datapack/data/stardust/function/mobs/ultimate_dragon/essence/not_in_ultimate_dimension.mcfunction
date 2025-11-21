
#> stardust:mobs/ultimate_dragon/essence/not_in_ultimate_dimension
#
# @executed	as @e[tag=stardust.check_ultimate_dragon_essence] & at @s
#
# @within	stardust:mobs/ultimate_dragon/essence/has_landed
#

# Tellraw and advancement	# TODO: Implement this properly
tellraw @a[distance=..128] ["",[{"text": "[", "color": "dark_aqua"}, [{"text": "S", "color": "#198534", "italic": false}, {"text": "t", "color": "#19863a"}, {"text": "a", "color": "#1a8841"}, {"text": "r", "color": "#1b8948"}, {"text": "d", "color": "#1b8b4e"}, {"text": "u", "color": "#1c8c55"}, {"text": "s", "color": "#1d8e5c"}, {"text": "t", "color": "#1d8f62"}, {"text": " ", "color": "#1e9169"}, {"text": "F", "color": "#1f9270"}, {"text": "r", "color": "#1f9476"}, {"text": "a", "color": "#20957d"}, {"text": "g", "color": "#219784"}, {"text": "m", "color": "#21988a"}, {"text": "e", "color": "#229a91"}, {"text": "n", "color": "#239b98"}, {"text": "t", "color": "#249d9f"}], {"text": "]", "color": "dark_aqua"}],{"translate": "stardust.the_ultimate_dragon_essence_fizzles_out_in_this_dimension"}]
advancement grant @a[distance=..128] only stardust:visible/adventure/waste_of_essence

# Kill the essence
kill @s

