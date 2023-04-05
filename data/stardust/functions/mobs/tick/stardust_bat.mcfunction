
#> stardust:mobs/tick/stardust_bat
#
# @within			stardust:mobs/tick/models
# @executed			as & at Model item display
#
# @description		Switch case on hurt time to change model
#

execute if score #temp stardust.data matches 1 run item replace entity @s container.0 with golden_hoe{CustomModelData:2013015}
execute if score #temp stardust.data matches 2 run item replace entity @s container.0 with golden_hoe{CustomModelData:2013016}

