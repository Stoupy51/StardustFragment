
#> stardust:custom_blocks/legendarium_seed/update_seed_model
#
# @executed	at @s
#
# @within	stardust:custom_blocks/legendarium_seed/place_secondary
#			stardust:custom_blocks/legendarium_seed/minute
#

# Update growth stage based on growth_time
execute if score @s stardust.growth_time matches 0..1919 unless score @s stardust.growth_stage matches 0 run function stardust:custom_blocks/change_seed_stage {stage:0, model:"stardust:seeds/legendarium_stage_0"}
execute if score @s stardust.growth_time matches 1920..3839 unless score @s stardust.growth_stage matches 1 run function stardust:custom_blocks/change_seed_stage {stage:1, model:"stardust:seeds/legendarium_stage_1"}
execute if score @s stardust.growth_time matches 3840.. unless score @s stardust.growth_stage matches 2 run function stardust:custom_blocks/change_seed_stage {stage:2, model:"stardust:seeds/legendarium_stage_2"}

