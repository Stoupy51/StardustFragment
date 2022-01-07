scoreboard players remove @s StardustFragment_Pillar 4
scoreboard players add @s[tag=StardustFragment_Angry] StardustFragment_Pillar 3
execute store result entity @s[tag=StardustFragment_ShieldOn] Health float 1 run scoreboard players get @s StardustFragment_Pillar
data modify entity @s NoAI set value 0b
