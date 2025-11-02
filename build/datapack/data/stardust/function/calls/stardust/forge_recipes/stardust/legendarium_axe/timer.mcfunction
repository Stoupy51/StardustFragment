
#> stardust:calls/stardust/forge_recipes/stardust/legendarium_axe/timer
#
# @within	stardust:calls/stardust/awakened_forge_recipes
#

# Timer
scoreboard players add @s stardust.forge_timer 4
scoreboard players remove @s[scores={stardust.forge_timer=1..}] stardust.forge_timer 3
scoreboard players reset @s[scores={stardust.forge_timer=..0}] stardust.forge_timer
execute if score @s stardust.forge_timer matches 1 run playsound stardust:awakened_forge_crafting ambient @a[distance=..25]
execute if score @s stardust.forge_timer matches 1.. run particle minecraft:dust{color:[0,1,0],scale:2} ~ ~ ~ 5 5 5 0.1 125

# When timer reaches 4, craft the item
execute if score @s stardust.forge_timer matches 4 run function stardust:calls/stardust/forge_recipes/stardust/legendarium_axe/craft

