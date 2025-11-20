
#> stardust:dimensions/structure/dungeon/part_8
#
# @within	stardust:dimensions/structure/dungeon/part_7 1t [ scheduled ]
#

# Load structure part dungeon_part_51_67_-147
execute store result score #success stardust.data in stardust:dungeon run place template stardust:dungeon_part_51_67_-147 51 67 -147

# If failed, error message
execute if score #success stardust.data matches 0 run tellraw @a {"translate": "stardust_fragment_error_the_stardust_dungeon_couldnt_be_built_so","color":"red"}

# Schedule next part if successful
execute if score #success stardust.data matches 1 run schedule function stardust:dimensions/structure/dungeon/part_9 1t

