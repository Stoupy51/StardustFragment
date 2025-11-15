
#> stardust:mobs/delay/spawn
#
# @executed	positioned ~ ~-2 ~
#
# @within	stardust:mobs/delay/convert
#			stardust:mobs/stardust_guardian/summon_mob [ positioned ~ ~-2 ~ ]
#

# Remove entity AI and set it Invulnerable during animation
data modify entity @s NoAI set value true
data modify entity @s Invulnerable set value true

# Tag as delayed entity
tag @s add stardust.delayed_convert

# Make the entity ascend for 50 ticks (2.5 seconds)
scoreboard players operation @s stardust.spawn_delay = #global_tick stardust.data
scoreboard players add @s stardust.spawn_delay 50

# Schedule end delay convert check
schedule function stardust:mobs/delay/schedule 1t append

