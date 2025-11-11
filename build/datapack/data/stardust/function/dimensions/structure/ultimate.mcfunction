
#> stardust:dimensions/structure/ultimate
#
# @executed	in stardust:ultimate
#
# @within	stardust:dimensions/load [ in stardust:ultimate ]
#

# Kill entities in the Ultimate Dimension before loading
kill @e[type=!player,x=-73,y=-60,z=-69,dx=144,dy=300,dz=144]
kill @e[type=!player,x=-73,y=-60,z=-69,dx=144,dy=300,dz=144]

# Load structure parts (stop on failure)
scoreboard players set #success stardust.data 1
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_-25_0_-21 -25 0 -21
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_-25_0_-69 -25 0 -69
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_-25_0_27 -25 0 27
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_-25_48_-21 -25 48 -21
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_-25_48_-69 -25 48 -69
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_-25_48_27 -25 48 27
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_-73_0_-21 -73 0 -21
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_-73_0_-69 -73 0 -69
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_-73_0_27 -73 0 27
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_-73_48_-21 -73 48 -21
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_-73_48_-69 -73 48 -69
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_-73_48_27 -73 48 27
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_-73_96_-21 -73 96 -21
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_-73_96_-69 -73 96 -69
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_23_0_-21 23 0 -21
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_23_0_-69 23 0 -69
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_23_0_27 23 0 27
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_23_48_-21 23 48 -21
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_23_48_-69 23 48 -69
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_23_48_27 23 48 27
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_23_96_-21 23 96 -21
execute if score #success stardust.data matches 1 store success score #success stardust.data run place template stardust:ultimate_part_23_96_-69 23 96 -69
forceload remove -73 -69 71 75

# Mark dimension as built if successful
execute if score #success stardust.data matches 1 run scoreboard players set #ultimate_built stardust.data 1
execute if score #success stardust.data matches 0 run tellraw @a {"translate": "stardust_fragment_error_the_ultimate_dimension_couldnt_be_load_s","color":"red"}

