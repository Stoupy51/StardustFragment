
#> stardust:dimensions/structure/ultimate/part_11
#
# @within	stardust:dimensions/structure/ultimate/part_10 1t [ scheduled ]
#

# Load structure part ultimate_part_-73_48_27
execute store result score #success stardust.data in stardust:ultimate run place template stardust:ultimate_part_-73_48_27 -73 48 27

# If failed, error message
execute if score #success stardust.data matches 0 run tellraw @a {"translate": "stardust_fragment_error_the_ultimate_dimension_couldnt_be_built_","color":"red"}

# Schedule next part if successful
execute if score #success stardust.data matches 1 run schedule function stardust:dimensions/structure/ultimate/part_12 1t

