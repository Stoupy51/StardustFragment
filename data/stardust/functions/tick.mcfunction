
#> stardust:tick
#
# @within			stardust:utils/tick_verification
# @executed			default context
#
# @description		Function executed every tick
#

# Utils
#function stardust:utils/z_personal_profiling_launch

# Stardust Pillar Tick (Need to be before tick_second)
execute if score #stardust_pillar stardust.data matches 1.. as @e[tag=stardust.stardust_pillar,tag=stardust.has_shield] run data modify entity @s NoAI set value 1b

## Timer
scoreboard players add #tick_2 stardust.data 1
scoreboard players add #second stardust.data 1
scoreboard players add #second_5 stardust.data 1
execute if score #tick_2 stardust.data matches 3.. run function stardust:tick_2
execute if score #second stardust.data matches 20.. run function stardust:tick_second
execute if score #second_5 stardust.data matches 90.. run function stardust:tick_second_5

## Others
# Prevent vex in stardust dimension
execute if score #in_stardust_dimension stardust.data matches 1.. run tp @e[type=vex,predicate=stardust:in_dim/stardust] 0 -10000 0

# Half second quarry system & Forges crafts (To be desynced with tick_second)
execute if score #second stardust.data matches 10 run function stardust:utils/quarry_system
execute if score #second stardust.data matches 10 as @e[type=item,predicate=simplenergy:has_tag] at @s run function stardust:forge/detect_craft

# Tick entities
execute as @e[type=item_display,tag=stardust.destroy_barrel,sort=random] at @s run function stardust:utils/tick_entities

# Tick mobs models and Stardust Pillar
execute as @e[type=item_display,tag=stardust.model,tag=!stardust.pillar_tick] at @s run function stardust:mobs/tick/
execute if score #stardust_pillar stardust.data matches 1.. as @e[type=item_display,tag=stardust.pillar_tick] at @s run function stardust:boss/stardust_pillar/tick

# Boss
execute if score #ultimate_boss stardust.data matches 1 in stardust:ultimate run function stardust:boss/ultimate_boss/tick

