
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

# Remove entity AI and set it Invulnerable during animation
data modify entity @s NoAI set value true
data modify entity @s Invulnerable set value true

# Tag as delayed entity
tag @s add stardust.delayed_convert

# Make the entity ascend for 32 ticks (1.6 seconds)
scoreboard players operation @s stardust.spawn_delay = #global_tick stardust.data
scoreboard players add @s stardust.spawn_delay 32

# Schedule end delay convert check
schedule function stardust:mobs/delay/schedule 1t append

