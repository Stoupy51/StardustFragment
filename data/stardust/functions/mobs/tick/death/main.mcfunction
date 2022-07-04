
scoreboard players remove @s stardust.cooldown 1
execute if score @s stardust.cooldown matches 11.. store result score #rotation stardust.data run data get entity @s Pose.Head[2] 1
execute if score @s stardust.cooldown matches 11.. run scoreboard players add #rotation stardust.data 10
execute if score @s stardust.cooldown matches 11.. store result entity @s Pose.Head[2] float 1 run scoreboard players get #rotation stardust.data
execute if score @s stardust.cooldown matches 11.. run tp @s ^0.22 ^ ^
execute if score @s stardust.cooldown matches 11.. at @s run tp @s ~ ~-0.22 ~

#death particles: /particle poof ~ ~1 ~ .1 .5 .1 0.05 10 normal @a[distance=..25]
execute if score @s stardust.cooldown matches 0 run kill @s
