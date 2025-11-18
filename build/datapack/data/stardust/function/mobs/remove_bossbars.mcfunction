
#> stardust:mobs/remove_bossbars
#
# @within	stardust:v3.5.0/minute
#

execute unless entity @e[tag=stardust.stoupy] run bossbar set stardust:stoup_army players
execute unless entity @e[tag=stardust.stardust_pillar] run bossbar set stardust:stardust_pillar players
execute unless entity @e[tag=stardust.stardust_guardian] run bossbar set stardust:stardust_guardian players
execute unless entity @e[tag=stardust.dragon] run bossbar set stardust:ultimate_dragon players

