
#> stardust:dimensions/structure/dungeon/part_10
#
# @within	stardust:dimensions/structure/dungeon/part_9 1t [ scheduled ]
#

# Load structure part dungeon_part_63_143_-77
execute store result score #success stardust.data in stardust:dungeon run place template stardust:dungeon_part_63_143_-77 63 143 -77

# If failed, error message
execute if score #success stardust.data matches 0 run tellraw @a {"translate": "stardust_fragment_the_stardust_dungeon_couldnt_be_built_somethin","color":"red"}

# Schedule next part if successful
execute if score #success stardust.data matches 1 run schedule function stardust:dimensions/structure/dungeon/part_11 1t

