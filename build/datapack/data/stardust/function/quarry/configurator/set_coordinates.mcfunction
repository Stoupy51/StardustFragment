
#> stardust:quarry/configurator/set_coordinates
#
# @within	stardust:quarry/configurator/at_aimed_block
#

# If sneaking, set 2nd coordinates, else set 1st coordinates
execute unless score #is_sneaking stardust.data matches 1 store result score #config_x1 stardust.data run data get entity @s Pos[0]
execute unless score #is_sneaking stardust.data matches 1 store result score #config_y1 stardust.data run data get entity @s Pos[1]
execute unless score #is_sneaking stardust.data matches 1 store result score #config_z1 stardust.data run data get entity @s Pos[2]
execute if score #is_sneaking stardust.data matches 1 store result score #config_x2 stardust.data run data get entity @s Pos[0]
execute if score #is_sneaking stardust.data matches 1 store result score #config_y2 stardust.data run data get entity @s Pos[1]
execute if score #is_sneaking stardust.data matches 1 store result score #config_z2 stardust.data run data get entity @s Pos[2]
kill @s

