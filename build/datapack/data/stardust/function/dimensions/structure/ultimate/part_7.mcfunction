
#> stardust:dimensions/structure/ultimate/part_7
#
# @within	stardust:dimensions/structure/ultimate/part_6 1t [ scheduled ]
#

# Load structure part ultimate_part_-73_0_-69
execute store result score #success stardust.data in stardust:ultimate run place template stardust:ultimate_part_-73_0_-69 -73 0 -69

# If failed, error message
execute if score #success stardust.data matches 0 run tellraw @a {"translate": "stardust_fragment_the_ultimate_dimension_couldnt_be_built_someth","color":"red"}

# Schedule next part if successful
execute if score #success stardust.data matches 1 run schedule function stardust:dimensions/structure/ultimate/part_8 1t

