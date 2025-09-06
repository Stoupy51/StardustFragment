
#> stardust:custom_blocks/ultimate_portal/place_main
#
# @within	stardust:custom_blocks/place
#

tag @s add stardust.placer
setblock ~ ~ ~ air
setblock ~ ~ ~ minecraft:barrel{"CustomName": [{"text": "U","italic": false,"color": "dark_purple","bold": true},{"text": "l","color": "blue"},{"text": "t","color": "dark_aqua"},{"text": "i","color": "aqua"},{"text": "m","color": "green"},{"text": "a","color": "yellow"},{"text": "t","color": "gold"},{"text": "e","color": "dark_red"},{"text": " P","color": "dark_purple"},{"text": "o","color": "blue"},{"text": "r","color": "dark_aqua"},{"text": "t","color": "aqua"},{"text": "a","color": "green"},{"text": "l","color": "yellow"}]}
execute align xyz positioned ~.5 ~.5 ~.5 summon item_display at @s run function stardust:custom_blocks/ultimate_portal/place_secondary
tag @s remove stardust.placer

# Increment count scores
scoreboard players add #total_custom_blocks stardust.data 1
scoreboard players add #total_vanilla_barrel stardust.data 1
scoreboard players add #total_ultimate_portal stardust.data 1

