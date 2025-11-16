
#> stardust:mobs/loop/mob_second
#
# @executed	at @s
#
# @within	stardust:mobs/loop/main [ at @s ]
#

execute if entity @s[tag=stardust.stoupy] run return run function stardust:mobs/stoupy/second
execute if entity @s[tag=stardust.stardust_bat] run return run function stardust:mobs/stardust_bat/second
execute if entity @s[tag=stardust.stardust_pillar] run return run function stardust:mobs/stardust_pillar/second
execute if entity @s[tag=stardust.stardust_guardian] run return run function stardust:mobs/stardust_guardian/second

