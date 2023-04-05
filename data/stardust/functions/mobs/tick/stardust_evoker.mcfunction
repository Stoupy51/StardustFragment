
#> stardust:mobs/tick/stardust_evoker
#
# @within			stardust:mobs/tick/models
# @executed			as & at Model item display
#
# @description		Switch case on hurt time to change model
#

execute if score #temp stardust.data matches 1 run item replace entity @s container.0 with golden_hoe{CustomModelData:2013010}
execute if score #temp stardust.data matches 2 run item replace entity @s container.0 with golden_hoe{CustomModelData:2013011}

