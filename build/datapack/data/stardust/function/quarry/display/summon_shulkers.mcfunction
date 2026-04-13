
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
execute at @s run summon block_display ~ ~ ~ {Tags:["stardust.quarry_displaying", "smithed.entity", "global.ignore", "smithed.strict", "global.ignore.kill"],block_state:{Name:"minecraft:red_shulker_box"},Glowing:1b,Team:"stardust.red"}
execute at @s run team join stardust.red @e[tag=stardust.quarry_displaying,nbt={block_state:{Name:"minecraft:red_shulker_box"}},distance=..1]

# Second shulker (blue)
execute store result entity @s Pos[0] double 1 run scoreboard players get #config_x2 stardust.data
execute store result entity @s Pos[1] double 1 run scoreboard players get #config_y2 stardust.data
execute store result entity @s Pos[2] double 1 run scoreboard players get #config_z2 stardust.data
execute at @s run summon block_display ~ ~ ~ {Tags:["stardust.quarry_displaying", "smithed.entity", "global.ignore", "smithed.strict", "global.ignore.kill"],block_state:{Name:"minecraft:blue_shulker_box"},Glowing:1b,Team:"stardust.blue"}
execute at @s run team join stardust.blue @e[tag=stardust.quarry_displaying,nbt={block_state:{Name:"minecraft:blue_shulker_box"}},distance=..1]

# Schedule loop to kill them after some time
schedule function stardust:quarry/display/kill_shulkers 1t append

# Kill marker
kill @s

