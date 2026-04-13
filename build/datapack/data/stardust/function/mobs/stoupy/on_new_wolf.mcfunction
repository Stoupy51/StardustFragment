
#> stardust:mobs/stoupy/on_new_wolf
#
# @executed	positioned ~ ~-2 ~
#
# @within	stardust:mobs/stoupy/summon_mob [ positioned ~ ~-2 ~ ]
#

# Delay spawn function
function stardust:mobs/delay/spawn

# Set loot table
data modify entity @s DeathLootTable set value "stardust:entities/stoup_army"

