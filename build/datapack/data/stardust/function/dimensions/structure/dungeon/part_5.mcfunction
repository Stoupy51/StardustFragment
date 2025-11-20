
#> stardust:dimensions/structure/dungeon/part_5
#
# @within	stardust:dimensions/structure/dungeon/part_4 1t [ scheduled ]
#

# Load structure part dungeon_part_131_94_-85
execute store result score #success stardust.data in stardust:dungeon run place template stardust:dungeon_part_131_94_-85 131 94 -85

# If failed, error message
execute if score #success stardust.data matches 0 run tellraw @a {"translate": "stardust_fragment_error_the_stardust_dungeon_couldnt_be_built_so","color":"red"}

# Schedule next part if successful
execute if score #success stardust.data matches 1 run schedule function stardust:dimensions/structure/dungeon/part_6 1t

