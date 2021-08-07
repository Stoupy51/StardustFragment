data modify entity @s[tag=!SF_StardustBat] ArmorDropChances set value [0.25F,0.15F,0.10F,0.05F]
data modify entity @s[tag=!SF_StardustBat] ArmorItems set value [{id:"minecraft:netherite_scrap",Count:1b},{id:"minecraft:netherite_scrap",Count:1b},{id:"minecraft:netherite_scrap",Count:1b},{id:"minecraft:netherite_scrap",Count:1b}]
execute at @a[distance=5..12,tag=!SF_NoBolt,gamemode=!spectator,gamemode=!creative] run summon minecraft:lightning_bolt
tag @s add SF_StardustBat
data modify entity @s Glowing set value 1b
team join SF_Stardust @s
