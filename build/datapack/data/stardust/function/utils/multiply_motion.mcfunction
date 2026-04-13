
#> stardust:utils/multiply_motion
#
# @executed	as @n[type=ender_pearl,tag=!stardust.motion_applied,nbt={...}]
#
# @within	stardust:advancements/ender_pearl {scale:1500} [ as @n[type=ender_pearl,tag=!stardust.motion_applied,nbt={...}] ]
#			stardust:advancements/ender_pearl {scale:2000} [ as @n[type=ender_pearl,tag=!stardust.motion_applied,nbt={...}] ]
#
# @args		scale (int)
#

# Can't directly multiply motion (Minecraft bug), so store in scoreboards first
$execute store result score #motion_x stardust.data run data get entity @s Motion[0] $(scale)
$execute store result score #motion_y stardust.data run data get entity @s Motion[1] $(scale)
$execute store result score #motion_z stardust.data run data get entity @s Motion[2] $(scale)
execute store result entity @s Motion[0] double 0.001 run scoreboard players get #motion_x stardust.data
execute store result entity @s Motion[1] double 0.001 run scoreboard players get #motion_y stardust.data
execute store result entity @s Motion[2] double 0.001 run scoreboard players get #motion_z stardust.data
tag @s add stardust.motion_applied

