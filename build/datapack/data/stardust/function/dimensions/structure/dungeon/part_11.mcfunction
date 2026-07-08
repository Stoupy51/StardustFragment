
#> stardust:dimensions/structure/dungeon/part_11
#
# @within	stardust:dimensions/structure/dungeon/part_10 1t [ scheduled ]
#

# Load structure part dungeon_part_72_68_-150
execute store result score #success stardust.data in stardust:dungeon run place template stardust:dungeon_part_72_68_-150 72 68 -150

# If failed, error message and allow a retry on the next check
execute if score #success stardust.data matches 0 run tellraw @a {"translate":"stardust_fragment_the_stardust_dungeon_couldnt_be_built_somethin","color":"red"}
execute if score #success stardust.data matches 0 run scoreboard players set #dungeon_building stardust.data 0

# Schedule next part if successful
execute if score #success stardust.data matches 1 run schedule function stardust:dimensions/structure/dungeon/final 1t

