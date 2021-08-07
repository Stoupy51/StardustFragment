tag @e[type=minecraft:stray,tag=SF_ToThrow] remove SF_ToThrow
tag @e[type=minecraft:evoker,tag=SF_ToThrow] remove SF_ToThrow
execute positioned ~ ~2 ~ run function stardust:mobs/stray
execute positioned ~2 ~ ~ run function stardust:mobs/stray
execute positioned ~-2 ~ ~ run function stardust:mobs/evoker
execute positioned ~ ~-2 ~ run function stardust:mobs/stray
execute positioned ~ ~ ~-2 run function stardust:mobs/stray
execute positioned ~ ~ ~2 run function stardust:mobs/evoker
execute at @e[tag=SF_ToThrow,distance=..10] run tp @e[tag=SF_ToThrow,limit=1,sort=nearest,distance=..10] ~ ~ ~ facing entity @s eyes
execute as @e[tag=SF_ToThrow,distance=..10] at @s run function stardust:boss/aim
playsound minecraft:entity.ghast.shoot hostile @a[distance=..50]

scoreboard players remove @s SF_Pillar 3
scoreboard players add @s[tag=SF_Angry] SF_Pillar 2
execute store result entity @s[tag=SF_ShieldOn] Health int 1 run scoreboard players get @s SF_Pillar
data modify entity @s NoAI set value 0b
