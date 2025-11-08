
#> stardust:quarry/configurator/at_aimed_block
#
# @within	???
#

# If targeted a quarry, update its configuration and stop particles
execute as @e[tag=stardust.quarry,dx=0,dy=0,dz=0] run return run function stardust:quarry/configurator/apply_to_quarry

# Particles and sound
particle firework ~.5 ~.5 ~.5 0.5 0.5 0.5 0.01 100
playsound block.note_block.bell ambient @s

# If sneaking, set 2nd coordinates, else set 1st coordinates
execute unless score #is_sneaking stardust.data matches 1 store result score #config_x1 stardust.data run data get storage bs:lambda raycast.targeted_block[0]
execute unless score #is_sneaking stardust.data matches 1 store result score #config_y1 stardust.data run data get storage bs:lambda raycast.targeted_block[1]
execute unless score #is_sneaking stardust.data matches 1 store result score #config_z1 stardust.data run data get storage bs:lambda raycast.targeted_block[2]
execute if score #is_sneaking stardust.data matches 1 store result score #config_x2 stardust.data run data get storage bs:lambda raycast.targeted_block[0]
execute if score #is_sneaking stardust.data matches 1 store result score #config_y2 stardust.data run data get storage bs:lambda raycast.targeted_block[1]
execute if score #is_sneaking stardust.data matches 1 store result score #config_z2 stardust.data run data get storage bs:lambda raycast.targeted_block[2]

# Update message
execute unless score #is_sneaking stardust.data matches 1 run tellraw @s [{"translate": "stardust.first_coordinates_set_to","color":"green"},{"score":{"name":"#config_x1","objective":"stardust.data"},"color":"dark_green"},{"text":", "},{"score":{"name":"#config_y1","objective":"stardust.data"},"color":"dark_green"},{"text":", "},{"score":{"name":"#config_z1","objective":"stardust.data"},"color":"dark_green"}]
execute if score #is_sneaking stardust.data matches 1 run tellraw @s [{"translate": "stardust.second_coordinates_set_to","color":"green"},{"score":{"name":"#config_x2","objective":"stardust.data"},"color":"dark_green"},{"text":", "},{"score":{"name":"#config_y2","objective":"stardust.data"},"color":"dark_green"},{"text":", "},{"score":{"name":"#config_z2","objective":"stardust.data"},"color":"dark_green"}]

