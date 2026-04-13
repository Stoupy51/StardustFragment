
#> stardust:mobs/stardust_pillar/second
#
# @executed	at @s
#
# @within	stardust:mobs/loop/mob_second
#

# Particles
particle dust{color:[0,0,1],scale:1} ~ ~-1 ~ 2 2 2 0 100

# Kill all vexes
tp @e[type=minecraft:vex,tag=!smithed.entity,tag=!global.ignore,tag=!smithed.strict,tag=!global.ignore.kill,distance=..96] ~ -10000 ~

# Check if angry (not in Stardust Dimension)
scoreboard players set #is_angry stardust.data 0
execute unless dimension stardust:stardust run scoreboard players set #is_angry stardust.data 3

# Count the number of custom mobs around and decrease that count if angry
execute store result score #mob_count stardust.data if entity @e[tag=stardust.mob_entity,distance=..40]
execute if score #is_angry stardust.data matches 1.. run scoreboard players operation #mob_count stardust.data /= #is_angry stardust.data

# Compute max allowed mobs based on players nearby (20 + 5 per player)
scoreboard players set #max_mobs stardust.data 20
scoreboard players set #per_player_mob_limit stardust.data 5
execute store result score #player_count stardust.data if entity @a[gamemode=!spectator,gamemode=!creative,distance=..96]
scoreboard players operation #per_player_mob_limit stardust.data *= #player_count stardust.data
scoreboard players operation #max_mobs stardust.data += #per_player_mob_limit stardust.data

# If under the limit, summon a wave of mobs on a random nearby player (every 5 seconds)
scoreboard players set #modulo_divisor stardust.data 5
scoreboard players operation #temp stardust.data = #global_second stardust.data
scoreboard players operation #temp stardust.data %= #modulo_divisor stardust.data
execute if score #temp stardust.data matches 0 if score #mob_count stardust.data < #max_mobs stardust.data at @r[gamemode=!spectator,gamemode=!creative,distance=..96] rotated ~ 0 run function stardust:mobs/stardust_pillar/summon_wave

# If lost half health, remove NoAI and remove shield (resistance effect)
execute store result score #health stardust.data run data get entity @s Health
execute if score #health stardust.data matches 251.. run effect give @s minecraft:resistance 5 4 true
execute if score #health stardust.data matches ..250 if data entity @s {NoAI:true} run function stardust:mobs/stardust_pillar/remove_shield

# Launch towards nearest player if shield is down
execute if score #health stardust.data matches ..250 if entity @p[gamemode=!spectator,gamemode=!creative,distance=..96] run function stardust:mobs/stardust_pillar/launch_towards_player

# Boss music for nearby players
execute as @a[distance=..200] unless score @s stardust.boss_music > #global_second stardust.data at @s run function stardust:mobs/stardust_pillar/try_boss_music

# Set bossbar for nearby players & update value
bossbar set stardust:stardust_pillar visible true
bossbar set stardust:stardust_pillar players @a[distance=..200]
execute store result bossbar stardust:stardust_pillar value run scoreboard players get #health stardust.data

