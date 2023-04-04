
# Reset scoreboard jump
scoreboard players reset @s stardust.jump

# If player have magnet tag, teleport items to player
execute if entity @s[tag=stardust.state.magnet] run tp @e[type=item,distance=..4,tag=!global.ignore,tag=!global.ignore.pos,tag=!smithed.entity] ~ ~ ~

