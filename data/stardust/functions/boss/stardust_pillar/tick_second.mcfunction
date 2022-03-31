execute store result score Count stardust.data if entity @e[tag=stardust.stardust_dim,distance=..40]
execute if entity @s[tag=stardust.angry] run scoreboard players operation Count stardust.data *= #4 simplenergy.data
execute store result score #max_count stardust.data if entity @a[distance=..200]
scoreboard players operation #max_count stardust.data *= #80 simplenergy.data
execute if score Count stardust.data <= #max_count stardust.data as @a[distance=..200] run function stardust:boss/stardust_pillar/stardust_mob
execute if score Count stardust.data <= #max_count stardust.data run function stardust:boss/stardust_pillar/remove_health
execute if score @s[tag=stardust.has_shield] stardust.pillar matches ..1 run function stardust:boss/stardust_pillar/remove_shield
