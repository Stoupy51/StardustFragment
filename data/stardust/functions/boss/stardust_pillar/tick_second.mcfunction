
execute store result score #count stardust.data if entity @e[tag=stardust.stardust_mob,distance=..40]
execute if entity @s[tag=stardust.angry] run scoreboard players operation #count stardust.data *= #4 simplenergy.data
execute store result score #max_count stardust.data if entity @a[distance=..200,gamemode=!spectator,gamemode=!creative]
scoreboard players operation #max_count stardust.data *= #80 simplenergy.data
execute if score #count stardust.data <= #max_count stardust.data as @a[distance=..200,gamemode=!spectator,gamemode=!creative] run function stardust:boss/stardust_pillar/stardust_mob
execute if score #count stardust.data <= #max_count stardust.data run function stardust:boss/stardust_pillar/remove_health
execute if score @s[tag=stardust.has_shield] stardust.pillar matches ..1 run function stardust:boss/stardust_pillar/remove_shield

#Health check
execute store result score #health stardust.data run data get entity @s Health
execute if score #health stardust.data matches ..200 run kill @s

