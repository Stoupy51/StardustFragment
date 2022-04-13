scoreboard objectives remove stardust.advanced_stats
scoreboard objectives remove stardust.config
scoreboard objectives remove stardust.data
scoreboard objectives remove stardust.data_2
scoreboard objectives remove stardust.forge_craft
scoreboard objectives remove stardust.wolfs
scoreboard objectives remove stardust.pillar
scoreboard objectives remove stardust.wormhole
scoreboard objectives remove stardust.right_click
scoreboard objectives remove stardust.jump
scoreboard objectives remove stardust.cooldown

scoreboard objectives remove stardust.quarry_x
scoreboard objectives remove stardust.quarry_y
scoreboard objectives remove stardust.quarry_z
scoreboard objectives remove stardust.quarry_x1
scoreboard objectives remove stardust.quarry_x2
scoreboard objectives remove stardust.quarry_y1
scoreboard objectives remove stardust.quarry_y2
scoreboard objectives remove stardust.quarry_z1
scoreboard objectives remove stardust.quarry_z2
scoreboard objectives remove stardust.quarry_status
scoreboard objectives remove stardust.quarry_size
scoreboard objectives remove stardust.quarry_speed
team remove stardust.team
team remove stardust.red
team remove stardust.blue

data remove storage stardust:main all
data remove storage stardust:main temp

tp @e[tag=stardust.destroyer] 0 -1000 0
kill @e[tag=stardust.destroyer]

clear @a #stardust:main{stardust:{}}

datapack disable "file/Stardust Fragment [v3.2.0]"
