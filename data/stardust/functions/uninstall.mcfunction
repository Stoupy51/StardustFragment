
scoreboard objectives remove stardust.id
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
scoreboard objectives remove stardust.life_crystals

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
data remove storage stardust:quarry all
data remove storage stardust:inventory all
data remove storage stardust:temp all
data remove storage stardust:manual all

tp @e[tag=stardust.destroyer] 0 -10000 0
kill @e[tag=stardust.destroyer]

clear @a #stardust:items{ctc:{from:"stoupy:stardust"}}

tellraw @s {"text":"You can now disable Stardust Fragment or delete it of your data packs folder","color":"green"}
