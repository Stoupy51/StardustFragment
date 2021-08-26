scoreboard players remove @s SF_Pillar 4
scoreboard players add @s[tag=SF_Angry] SF_Pillar 3
execute store result entity @s[tag=SF_ShieldOn] Health float 1 run scoreboard players get @s SF_Pillar
data modify entity @s NoAI set value 0b
