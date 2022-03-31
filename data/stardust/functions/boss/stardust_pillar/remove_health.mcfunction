scoreboard players remove @s stardust.pillar 4
scoreboard players add @s[tag=stardust.angry] stardust.pillar 3
execute store result entity @s[tag=stardust.has_shield] Health float 1 run scoreboard players get @s stardust.pillar
data modify entity @s NoAI set value 0b
