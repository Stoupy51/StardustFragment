
#> stardust:mobs/delay/convert
#
# @executed	positioned ~ ~-2 ~
#
# @within	stardust:mobs/stardust_pillar/summon_mob {"entity":"stardust_bat"} [ positioned ~ ~-2 ~ ]
#			stardust:mobs/stardust_pillar/summon_mob {"entity":"stardust_evoker"} [ positioned ~ ~-2 ~ ]
#			stardust:mobs/stardust_pillar/summon_mob {"entity":"stardust_soldier"} [ positioned ~ ~-2 ~ ]
#
# @args		entity (string)
#

# Convert now
$function stardust:mobs/$(entity)/convert

# Delay spawn
function stardust:mobs/delay/spawn

# Incompatibility with RandomMobSizes (due to how it modifies entity size on summon)
tag @s add random_mob_sizes.checked

