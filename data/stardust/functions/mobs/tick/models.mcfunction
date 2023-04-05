
#> stardust:mobs/tick/models
#
# @within			stardust:mobs/tick/secondary
# @executed			as & at Model item display
#
# @description		Switch case for all mob models
#

execute if entity @s[tag=stardust.stardust_soldier] run function stardust:mobs/tick/stardust_soldier
execute if entity @s[tag=stardust.stardust_evoker] run function stardust:mobs/tick/stardust_evoker
execute if entity @s[tag=stardust.stardust_bat] run function stardust:mobs/tick/stardust_bat

