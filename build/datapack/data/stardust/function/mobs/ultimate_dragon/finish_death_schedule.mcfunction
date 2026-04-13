
#> stardust:mobs/ultimate_dragon/finish_death_schedule
#
# @within	stardust:mobs/ultimate_dragon/death 199t append [ scheduled ]
#

execute at @e[tag=stardust.dying_model,tag=stardust.ultimate_dragon] run function stardust:mobs/ultimate_dragon/finish_death_at_entity

