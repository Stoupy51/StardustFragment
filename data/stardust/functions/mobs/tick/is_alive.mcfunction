
#> stardust:mobs/tick/is_alive
#
# @within			stardust:mobs/tick/secondary
# @executed			as & at Model item display
#
# @description		Model is alive, manage HurtTime and Rotation
#

# Score and storage init
execute on vehicle run data modify storage stardust:temp all set from entity @s
scoreboard players set #hurt_time stardust.data 0
execute store result score #hurt_time stardust.data run data get storage stardust:temp all.HurtTime

# Apply rotation (Only yaw)
data modify entity @s Rotation[0] set from storage stardust:temp all.Rotation[0]

# Check cooldown, if 0, set temp to 1, if hurt time, set temp to 2
scoreboard players add @s stardust.cooldown 0
execute if score @s stardust.cooldown matches 0 run scoreboard players set #temp stardust.data 1
execute if score @s stardust.cooldown matches 0 unless score #hurt_time stardust.data matches 0 run scoreboard players set #temp stardust.data 2

# If hurt time, set cooldown
execute if score #temp stardust.data matches 2 run scoreboard players operation @s stardust.cooldown = #hurt_time stardust.data

# Decrease cooldown
scoreboard players remove @s[scores={stardust.cooldown=1..}] stardust.cooldown 1

