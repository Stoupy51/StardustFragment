
#> stardust:dimensions/structure/dungeon/start
#
# @executed	in stardust:dungeon
#
# @within	stardust:dimensions/load [ in stardust:dungeon ]
#

# Load structure part dungeon_part_-19_54_-15
execute store result score #success stardust.data in stardust:dungeon run place template stardust:dungeon_part_-19_54_-15 -19 54 -15

# If failed, error message
execute if score #success stardust.data matches 0 run tellraw @a {"translate": "stardust_fragment_error_the_stardust_dungeon_couldnt_be_built_so","color":"red"}

# Schedule next part if successful
execute if score #success stardust.data matches 1 run schedule function stardust:dimensions/structure/dungeon/part_1 1t

