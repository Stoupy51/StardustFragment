
#> stardust:boss/stardust_pillar/tick
#
# @within			stardust:tick
# @executed			as & at the Stardust Pillar model
#
# @description		Function executed every tick :
#					- Update the model of the Stardust Pillar depending on the HurtTime
#					- Apply the entity rotation
#					- Spawn particles
#					- Manage the death case
#

# Score initialisation & Getting nbt data
scoreboard players set #hurt_case stardust.data 0
scoreboard players set #success stardust.data 0
scoreboard players set #hurt_time stardust.data 0
scoreboard players operation #predicate stardust.data = @s stardust.id
execute store success score #success stardust.data on vehicle run data modify storage stardust:temp all set from entity @s

## Update model depending on HurtTime
# Get HurtTime in a score if Stardust Pillar is alive
execute if score #success stardust.data matches 1 store result score #hurt_time stardust.data run data get storage stardust:temp all.HurtTime

# Check hurt case : (If entity is hurt, but not anymore) (If entity isn't hurt but is now)
execute if entity @s[tag=stardust.hurt] if score #hurt_time stardust.data matches 0 run scoreboard players set #hurt_case stardust.data 1
execute if entity @s[tag=!stardust.hurt] unless score #hurt_time stardust.data matches 0 run scoreboard players set #hurt_case stardust.data 2

# Update model depending on hurt case
execute if score #hurt_case stardust.data matches 1 run tag @s remove stardust.hurt
execute if score #hurt_case stardust.data matches 1 run item replace entity @s container.0 with golden_hoe{CustomModelData:2013000}
execute if score #hurt_case stardust.data matches 2 run tag @s add stardust.hurt
execute if score #hurt_case stardust.data matches 2 run item replace entity @s container.0 with golden_hoe{CustomModelData:2013001}

## Others
# Apply entity rotation if Stardust Pillar is alive and has AI
execute if score #success stardust.data matches 1 if data storage stardust:temp all{NoAI:0b} run data modify entity @s Rotation set from storage stardust:temp all.Rotation

# Particles
particle dust 0 0 255 1 ~ ~-1 ~ 2 2 2 0 10

# Death case
execute if score #success stardust.data matches 0 run function stardust:boss/stardust_pillar/defeated

