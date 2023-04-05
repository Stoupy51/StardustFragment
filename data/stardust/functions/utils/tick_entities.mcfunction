
#> stardust:utils/tick_entities
#
# @within			stardust:tick
# @executed			as & at current entity (custom block)
#
# @description		Function executed every tick for every entity that has stardust.tick_entities tag
#

execute if entity @s[tag=stardust.destroy_barrel] unless block ~ ~ ~ barrel run function stardust:destroy/groups/barrel

