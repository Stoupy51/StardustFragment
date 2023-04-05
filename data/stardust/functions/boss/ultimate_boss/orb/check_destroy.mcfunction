
#> stardust:boss/ultimate_boss/orb/check_destroy
#
# @within			stardust:boss/ultimate_boss/tick
# @executed			as & at Orb item display
#
# @description		Check if vehicle is destroyed, if so, destroy the orb and damage the dragons
#

# Check if vehicle is destroyed
scoreboard players set #success stardust.data 0
execute on passengers run scoreboard players set #success stardust.data 1

# If vehicle is destroyed, destroy orb and damage dragons
execute if score #success stardust.data matches 0 as @e[type=ender_dragon,tag=stardust.dragon] store result entity @s Health float 0.99 run data get entity @s Health
execute if score #success stardust.data matches 0 run kill @s

