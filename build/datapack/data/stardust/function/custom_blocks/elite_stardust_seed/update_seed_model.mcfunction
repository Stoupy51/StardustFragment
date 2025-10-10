
#> stardust:custom_blocks/elite_stardust_seed/update_seed_model
#
# @executed	at @s
#
# @within	stardust:custom_blocks/elite_stardust_seed/place_secondary
#			stardust:custom_blocks/elite_stardust_seed/minute
#

# Update growth stage based on growth_time
execute if score @s stardust.growth_time matches 0..959 unless score @s stardust.growth_stage matches 0 run function stardust:custom_blocks/change_seed_stage {stage:0, model:"stardust:seeds/elite_stardust_stage_0"}
execute if score @s stardust.growth_time matches 960..1919 unless score @s stardust.growth_stage matches 1 run function stardust:custom_blocks/change_seed_stage {stage:1, model:"stardust:seeds/elite_stardust_stage_1"}
execute if score @s stardust.growth_time matches 1920.. unless score @s stardust.growth_stage matches 2 run function stardust:custom_blocks/change_seed_stage {stage:2, model:"stardust:seeds/elite_stardust_stage_2"}

