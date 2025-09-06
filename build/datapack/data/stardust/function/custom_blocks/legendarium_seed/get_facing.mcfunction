
#> stardust:custom_blocks/legendarium_seed/get_facing
#
# @executed	as @e[type=item_frame,tag=...] & at @s
#
# @within	stardust:custom_blocks/legendarium_seed/place_main
#

# Get the facing and delete the old entity
execute store result score #item_frame_facing stardust.data run data get entity @s Facing
kill @s

