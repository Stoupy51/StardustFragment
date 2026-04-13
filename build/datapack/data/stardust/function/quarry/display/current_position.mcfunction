
#> stardust:quarry/display/current_position
#
# @executed	at @s
#
# @within	stardust:quarry/working/break_at_position [ at @s ]
#

# Summon shulker and schedule loop to kill them after some time
execute at @s run summon block_display ~ ~ ~ {Tags:["stardust.quarry_displaying", "smithed.entity", "global.ignore", "smithed.strict", "global.ignore.kill"],block_state:{Name:"minecraft:white_shulker_box"},Glowing:1b}

