
#> stardust:tick_second
#
# @within			stardust:tick
# @executed			default context
#
# @description		Function executed every second
#

# Timer
scoreboard players set #second stardust.data 0

# Tick Second entities
execute as @e[type=item_display,tag=stardust.destroyer,tag=!simplenergy.item_destroy,sort=random] at @s run function stardust:utils/tick_second_entities

# Tick Second players
execute as @a[sort=random] at @s run function stardust:utils/tick_second_players

# Tick Second in Stardust Dungeon
execute unless score #tick_dungeon stardust.data matches 0 in stardust:dungeon run function stardust:tick_second_dungeon
scoreboard players reset #tick_dungeon stardust.data

# Bosses (Ultimate Boss, Stardust Pillar, Stoup Army)
execute if score #ultimate_boss stardust.data matches 1 in stardust:ultimate run function stardust:boss/ultimate_boss/tick_second
execute if score #stardust_pillar stardust.data matches 1.. as @e[type=wither,tag=stardust.stardust_pillar,sort=random] at @s run function stardust:boss/stardust_pillar/tick_second
execute as @e[type=wolf,tag=stardust.stoup_army] at @s run function stardust:boss/stouparmy

# Transform natural mobs in Celestial Dimension or Stardust Dimension
execute as @e[type=#stardust:global,predicate=stardust:in_dim/celestial_or_stardust,tag=!stardust.celestial_dim,tag=!stardust.stardust_mob,tag=!global.ignore,tag=!global.ignore.pos,tag=!smithed.entity] at @s run function stardust:mobs/dimensions_check

