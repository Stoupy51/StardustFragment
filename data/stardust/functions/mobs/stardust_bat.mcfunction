data modify entity @s[tag=!StardustFragment_StardustBat] DeathLootTable set value "stardust:entities/stardust_bat"
execute at @a[distance=5..12,tag=!StardustFragment_NoBolt,gamemode=!spectator,gamemode=!creative] run summon minecraft:lightning_bolt
tag @s add StardustFragment_StardustBat
data modify entity @s Glowing set value 1b
team join StardustFragment_Stardust @s
