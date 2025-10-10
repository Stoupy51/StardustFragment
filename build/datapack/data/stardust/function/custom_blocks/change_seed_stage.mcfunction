
#> stardust:custom_blocks/change_seed_stage
#
# @executed	at @s
#
# @within	stardust:custom_blocks/diamond_seed/update_seed_model {stage:0, model:"stardust:seeds/diamond_stage_0"}
#			stardust:custom_blocks/diamond_seed/update_seed_model {stage:1, model:"stardust:seeds/diamond_stage_1"}
#			stardust:custom_blocks/diamond_seed/update_seed_model {stage:2, model:"stardust:seeds/diamond_stage_2"}
#			stardust:custom_blocks/advanced_diamond_seed/update_seed_model {stage:0, model:"stardust:seeds/advanced_diamond_stage_0"}
#			stardust:custom_blocks/advanced_diamond_seed/update_seed_model {stage:1, model:"stardust:seeds/advanced_diamond_stage_1"}
#			stardust:custom_blocks/advanced_diamond_seed/update_seed_model {stage:2, model:"stardust:seeds/advanced_diamond_stage_2"}
#			stardust:custom_blocks/stardust_seed/update_seed_model {stage:0, model:"stardust:seeds/stardust_stage_0"}
#			stardust:custom_blocks/stardust_seed/update_seed_model {stage:1, model:"stardust:seeds/stardust_stage_1"}
#			stardust:custom_blocks/stardust_seed/update_seed_model {stage:2, model:"stardust:seeds/stardust_stage_2"}
#			stardust:custom_blocks/advanced_stardust_seed/update_seed_model {stage:0, model:"stardust:seeds/advanced_stardust_stage_0"}
#			stardust:custom_blocks/advanced_stardust_seed/update_seed_model {stage:1, model:"stardust:seeds/advanced_stardust_stage_1"}
#			stardust:custom_blocks/advanced_stardust_seed/update_seed_model {stage:2, model:"stardust:seeds/advanced_stardust_stage_2"}
#			stardust:custom_blocks/elite_stardust_seed/update_seed_model {stage:0, model:"stardust:seeds/elite_stardust_stage_0"}
#			stardust:custom_blocks/elite_stardust_seed/update_seed_model {stage:1, model:"stardust:seeds/elite_stardust_stage_1"}
#			stardust:custom_blocks/elite_stardust_seed/update_seed_model {stage:2, model:"stardust:seeds/elite_stardust_stage_2"}
#			stardust:custom_blocks/legendarium_seed/update_seed_model {stage:0, model:"stardust:seeds/legendarium_stage_0"}
#			stardust:custom_blocks/legendarium_seed/update_seed_model {stage:1, model:"stardust:seeds/legendarium_stage_1"}
#			stardust:custom_blocks/legendarium_seed/update_seed_model {stage:2, model:"stardust:seeds/legendarium_stage_2"}
#			stardust:custom_blocks/solarium_seed/update_seed_model {stage:0, model:"stardust:seeds/solarium_stage_0"}
#			stardust:custom_blocks/solarium_seed/update_seed_model {stage:1, model:"stardust:seeds/solarium_stage_1"}
#			stardust:custom_blocks/solarium_seed/update_seed_model {stage:2, model:"stardust:seeds/solarium_stage_2"}
#			stardust:custom_blocks/darkium_seed/update_seed_model {stage:0, model:"stardust:seeds/darkium_stage_0"}
#			stardust:custom_blocks/darkium_seed/update_seed_model {stage:1, model:"stardust:seeds/darkium_stage_1"}
#			stardust:custom_blocks/darkium_seed/update_seed_model {stage:2, model:"stardust:seeds/darkium_stage_2"}
#

# Update the growth stage score
$scoreboard players set @s stardust.growth_stage $(stage)

# Change the item model to the right stage
$execute if entity @s[type=item_display] run return run data modify entity @s item.components."minecraft:item_model" set value "$(model)"
$execute if entity @s[type=item_frame] run return run data modify entity @s Item.components."minecraft:item_model" set value "$(model)"

