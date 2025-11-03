
#> stardust:calls/stardust/growth_accelerator
#
# @within	#stardust:calls/growth_accelerator
#

# Boost stardust seed by +10 minutes
scoreboard players set #boost_growth_time stardust.data 600
execute positioned ~-10 ~-10 ~-10 as @e[tag=stardust.growing_seed,dx=20,dy=20,dz=20] run function stardust:custom_blocks/minute
scoreboard players reset #boost_growth_time stardust.data

