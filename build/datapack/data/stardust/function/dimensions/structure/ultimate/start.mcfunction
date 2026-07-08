
#> stardust:dimensions/structure/ultimate/start
#
# @within	stardust:dimensions/rebuild/ultimate 2s [ scheduled ]
#

# Load structure part ultimate_part_-25_0_-21
execute store result score #success stardust.data in stardust:ultimate run place template stardust:ultimate_part_-25_0_-21 -25 0 -21

# If failed, error message and allow a retry on the next check
execute if score #success stardust.data matches 0 run tellraw @a {"translate":"stardust_fragment_the_ultimate_dimension_couldnt_be_built_someth","color":"red"}
execute if score #success stardust.data matches 0 run scoreboard players set #ultimate_building stardust.data 0

# Schedule next part if successful
execute if score #success stardust.data matches 1 run schedule function stardust:dimensions/structure/ultimate/part_1 1t

