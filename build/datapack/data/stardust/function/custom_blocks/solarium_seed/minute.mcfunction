
#> stardust:custom_blocks/solarium_seed/minute
#
# @executed	positioned ~-10 ~-10 ~-10 & as @e[tag=stardust.growing_seed,dx=20,dy=20,dz=20]
#
# @within	stardust:custom_blocks/minute
#

# Increment growth time score by 60 and update model
scoreboard players add @s stardust.growth_time 60
execute if score #boost_growth_time stardust.data matches 1.. run scoreboard players operation @s stardust.growth_time += #boost_growth_time stardust.data
function stardust:custom_blocks/solarium_seed/update_seed_model

