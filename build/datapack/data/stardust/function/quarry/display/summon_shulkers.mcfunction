
#> stardust:quarry/display/summon_shulkers
#
# @executed	as @e[tag=stardust.second] & at @s
#
# @within	stardust:quarry/display/main
#

# First shulker (red)
execute store result entity @s Pos[0] double 1 run scoreboard players get #config_x1 stardust.data
execute store result entity @s Pos[1] double 1 run scoreboard players get #config_y1 stardust.data
execute store result entity @s Pos[2] double 1 run scoreboard players get #config_z1 stardust.data
execute at @s positioned ~0.5 ~ ~0.5 run summon shulker ~ ~ ~ {Tags:["stardust.quarry_displaying", "smithed.entity", "global.ignore", "smithed.strict", "global.ignore.kill"],DeathLootTable:"none",AttachFace:0,Color:14b,Invulnerable:1b,NoAI:1b,Silent:1b,Glowing:1b,Team:"stardust.red"}

# Second shulker (blue)
execute store result entity @s Pos[0] double 1 run scoreboard players get #config_x2 stardust.data
execute store result entity @s Pos[1] double 1 run scoreboard players get #config_y2 stardust.data
execute store result entity @s Pos[2] double 1 run scoreboard players get #config_z2 stardust.data
execute at @s positioned ~0.5 ~ ~0.5 run summon shulker ~ ~ ~ {Tags:["stardust.quarry_displaying", "smithed.entity", "global.ignore", "smithed.strict", "global.ignore.kill"],DeathLootTable:"none",AttachFace:0,Color:3b,Invulnerable:1b,NoAI:1b,Silent:1b,Glowing:1b,Team:"stardust.blue"}

# Schedule loop to kill them after some time
schedule function stardust:quarry/display/kill_shulkers 1t append

# Kill marker
kill @s

