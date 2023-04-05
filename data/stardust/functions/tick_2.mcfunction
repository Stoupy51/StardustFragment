
#> stardust:tick_2
#
# @within			stardust:tick
# @executed			default context
#
# @description		Function executed every 2 ticks
#

## Timer
scoreboard players set #tick_2 stardust.data 1

## Others
# Destroy
execute as @e[tag=stardust.destroyer,tag=!simplenergy.item_destroy,predicate=!stardust:check_destroyer] at @s run function stardust:destroy/all

# Custom structures
execute as @e[type=marker,tag=stardust.structure] at @s run function stardust:calls/smart_ore_generation/structure/all

# Tick entities (2 ticks)
execute as @e[type=item_display,tag=stardust.tick_2_entities,sort=random] at @s run function stardust:utils/tick_2_entities

# Forge loop if there is an incoming craft
execute if score #forge_craft stardust.data matches 1.. as @e[type=item,scores={stardust.forge_craft=0..}] at @s run function stardust:forge/particles

# Place a plateform for dimension transitions
execute as @e[type=marker,tag=stardust.dimension_platform] at @s run function stardust:dimensions/platform

# Dimension transitions for entities
execute as @e[type=!#energy:valid_block_entities,tag=!global.ignore,tag=!global.ignore.pos,tag=!smithed.entity,tag=!simplenergy.item_destroy,predicate=stardust:transition] at @s run function stardust:dimensions/transitions

# Loop for players (2 ticks)
execute as @a[sort=random] at @s run function stardust:utils/tick_2_players

