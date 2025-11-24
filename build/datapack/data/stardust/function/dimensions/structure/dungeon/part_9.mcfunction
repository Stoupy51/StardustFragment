
#> stardust:dimensions/structure/dungeon/part_9
#
# @within	stardust:dimensions/structure/dungeon/part_8 1t [ scheduled ]
#

# Load structure part dungeon_part_57_123_4
execute store result score #success stardust.data in stardust:dungeon run place template stardust:dungeon_part_57_123_4 57 123 4

# If failed, error message
execute if score #success stardust.data matches 0 run tellraw @a {"translate": "stardust_fragment_the_stardust_dungeon_couldnt_be_built_somethin","color":"red"}

# Schedule next part if successful
execute if score #success stardust.data matches 1 run schedule function stardust:dimensions/structure/dungeon/part_10 1t

