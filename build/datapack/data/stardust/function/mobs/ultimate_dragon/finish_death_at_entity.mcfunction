
#> stardust:mobs/ultimate_dragon/finish_death_at_entity
#
# @executed	at @e[tag=...]
#
# @within	stardust:mobs/ultimate_dragon/finish_death_schedule [ at @e[tag=...] ]
#

# Advancement
advancement grant @a[distance=..200] only stardust:visible/adventure/ultimate_boss
execute as @a[distance=..200] unless score @s stardust.damage_taken_ub matches 200.. run advancement grant @s only stardust:visible/adventure/ultimate_boss_ez
scoreboard objectives remove stardust.damage_taken_ub

# Rewards players
loot give @a[distance=..200] loot stardust:entities/ultimate_dragon

# End boss music (unless remaining boss)
execute unless entity @e[tag=!stardust.dying_model,tag=stardust.ultimate_dragon] as @a[distance=..200] if score @s stardust.boss_music > #global_second stardust.data run stopsound @s record

# Summon ultimate dragon egg item
loot spawn ~ ~ ~ loot stardust:i/ultimate_dragon_egg
execute as @n[type=item,nbt={Item:{components:{"minecraft:custom_data":{stardust:{ultimate_dragon_egg:true}}}}}] run function stardust:mobs/ultimate_dragon/unique_drop

# Remove bossbar (from all players)
bossbar set stardust:ultimate_dragon players

# Tellraw and playsound
tellraw @a ["",[{"text": "[", "color": "dark_aqua"}, [{"text": "S", "color": "#198534", "italic": false}, {"text": "t", "color": "#19863a"}, {"text": "a", "color": "#1a8841"}, {"text": "r", "color": "#1b8948"}, {"text": "d", "color": "#1b8b4e"}, {"text": "u", "color": "#1c8c55"}, {"text": "s", "color": "#1d8e5c"}, {"text": "t", "color": "#1d8f62"}, {"text": " ", "color": "#1e9169"}, {"text": "F", "color": "#1f9270"}, {"text": "r", "color": "#1f9476"}, {"text": "a", "color": "#20957d"}, {"text": "g", "color": "#219784"}, {"text": "m", "color": "#21988a"}, {"text": "e", "color": "#229a91"}, {"text": "n", "color": "#239b98"}, {"text": "t", "color": "#249d9f"}], {"text": "]", "color": "dark_aqua"}],{"translate": "stardust.the"},[{"text": "U", "color": "#ff0000", "italic": false}, {"text": "l", "color": "#ff6600"}, {"text": "t", "color": "#ffcc00"}, {"text": "i", "color": "#ccff00"}, {"text": "m", "color": "#65ff00"}, {"text": "a", "color": "#00ff00"}, {"text": "t", "color": "#00ff65"}, {"text": "e", "color": "#00ffcb"}, {"text": " ", "color": "#00cbff"}, {"text": "D", "color": "#0065ff"}, {"text": "r", "color": "#0000ff"}, {"text": "a", "color": "#6600ff"}, {"text": "g", "color": "#cb00ff"}, {"text": "o", "color": "#ff00cb"}, {"text": "n", "color": "#ff0066"}],{"translate": "stardust.has_been_defeated_congratulations"}]
execute as @a at @s run playsound minecraft:ui.toast.challenge_complete ambient @s

# Rebuild the dimension after 20s
scoreboard players reset #ultimate_built stardust.data
schedule function stardust:dimensions/ensure_built 20s

