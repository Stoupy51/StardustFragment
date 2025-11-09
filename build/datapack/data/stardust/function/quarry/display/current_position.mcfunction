
#> stardust:quarry/display/current_position
#
# @executed	at @s
#
# @within	stardust:quarry/working/break_at_position [ at @s ]
#

# Summon shulker and schedule loop to kill them after some time
execute positioned ~0.5 ~ ~0.5 run summon shulker ~ ~ ~ {Tags:["stardust.quarry_displaying", "smithed.entity", "global.ignore", "smithed.strict", "global.ignore.kill"],DeathLootTable:"none",AttachFace:0,Color:0b,Invulnerable:1b,NoAI:1b,Silent:1b,Glowing:1b}

