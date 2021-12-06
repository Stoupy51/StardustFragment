data modify entity @s[tag=!SF_StardustBat] DeathLootTable set value "stardust:entities/stardust_bat"
execute at @a[distance=5..12,tag=!SF_NoBolt,gamemode=!spectator,gamemode=!creative] run summon minecraft:lightning_bolt
tag @s add SF_StardustBat
data modify entity @s Glowing set value 1b
team join SF_Stardust @s
