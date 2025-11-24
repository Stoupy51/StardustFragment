
#> stardust:dimensions/structure/ultimate/part_1
#
# @within	stardust:dimensions/structure/ultimate/start 1t [ scheduled ]
#

# Load structure part ultimate_part_-25_0_-69
execute store result score #success stardust.data in stardust:ultimate run place template stardust:ultimate_part_-25_0_-69 -25 0 -69

# If failed, error message
execute if score #success stardust.data matches 0 run tellraw @a {"translate": "stardust_fragment_the_ultimate_dimension_couldnt_be_built_someth","color":"red"}

# Schedule next part if successful
execute if score #success stardust.data matches 1 run schedule function stardust:dimensions/structure/ultimate/part_2 1t

