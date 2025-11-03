
#> stardust:custom_blocks/growth_accelerator/second_5
#
# @executed	as @e[tag=stardust.second_5] & at @s
#
# @within	stardust:custom_blocks/second_5
#

# Consume 5 times kW energy
execute unless score @s energy.storage matches 500.. run return 0
scoreboard players remove @s energy.storage 500

# Timer to 1 minute, stop function if not yet reached
scoreboard players add @s stardust.data 5
execute if score @s stardust.data matches ..59 run return run title @a[distance=..5] actionbar [{"score":{"objective":"stardust.data","name":"@s"},"color":"aqua"},{"text":"/","color":"yellow"},"60",{"translate": "stardust.s_before_activation","color":"yellow"}]
scoreboard players reset @s stardust.data

# Audio-visual effects when reaching 1 minute
playsound minecraft:block.beacon.activate block @a[distance=..50]
particle minecraft:happy_villager ~ ~ ~ 5 5 5 1 125 normal @a[distance=..50]

# Accelerate growth in a 10x10 area
scoreboard players set #count_y stardust.data 21
execute positioned ~10 ~10 ~10 run function stardust:custom_blocks/growth_accelerator/layer_y
scoreboard players reset #count_x
scoreboard players reset #count_y
scoreboard players reset #count_z

# Launch a signal for data packs that want their custom seed to be compatible.
function #stardust:calls/growth_accelerator

