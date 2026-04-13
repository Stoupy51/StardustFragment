
#> stardust:mobs/ultimate_dragon/fireball_burst/summon_command
#
# @executed	facing entity @p[gamemode=!spectator,gamemode=!creative,distance=..200] eyes & positioned ^ ^ ^5
#
# @within	stardust:mobs/ultimate_dragon/fireball_burst/launch [ facing entity @p[gamemode=!spectator,gamemode=!creative,distance=..200] eyes & positioned ^ ^ ^5 ]
#

# 1/20 chance that it's a dragon breath instead
execute store result score #random stardust.data run random value 1..20
execute if score #random stardust.data matches 1 summon minecraft:dragon_fireball run return run function stardust:mobs/ultimate_dragon/fireball_burst/on_new_ball
execute if score #random stardust.data matches 2.. summon minecraft:fireball run return run function stardust:mobs/ultimate_dragon/fireball_burst/on_new_ball

