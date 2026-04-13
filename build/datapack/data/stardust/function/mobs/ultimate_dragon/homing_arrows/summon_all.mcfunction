
#> stardust:mobs/ultimate_dragon/homing_arrows/summon_all
#
# @executed	facing entity @p[gamemode=!spectator,gamemode=!creative,distance=..200] eyes & positioned ^ ^ ^5
#
# @within	stardust:mobs/ultimate_dragon/homing_arrows/launch [ facing entity @p[gamemode=!spectator,gamemode=!creative,distance=..200] eyes & positioned ^ ^ ^5 ]
#

# Summon 5 arrows with different effects
execute positioned ~ ~5 ~ summon minecraft:arrow run function stardust:mobs/ultimate_dragon/homing_arrows/on_new_arrow {effect:"slowness"}
execute positioned ~5 ~ ~5 summon minecraft:arrow run function stardust:mobs/ultimate_dragon/homing_arrows/on_new_arrow {effect:"poison"}
execute positioned ~-5 ~ ~5 summon minecraft:arrow run function stardust:mobs/ultimate_dragon/homing_arrows/on_new_arrow {effect:"wither"}
execute positioned ~5 ~ ~-5 summon minecraft:arrow run function stardust:mobs/ultimate_dragon/homing_arrows/on_new_arrow {effect:"darkness"}
execute positioned ~-5 ~ ~-5 summon minecraft:arrow run function stardust:mobs/ultimate_dragon/homing_arrows/on_new_arrow {effect:"levitation"}

