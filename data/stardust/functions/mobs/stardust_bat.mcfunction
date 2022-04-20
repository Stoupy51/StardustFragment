
data modify entity @s[tag=!stardust.stardust_bat] DeathLootTable set value "stardust:entities/stardust_bat"
execute at @a[distance=5..12,tag=!stardust.no_bolt,gamemode=!spectator,gamemode=!creative] run summon lightning_bolt
tag @s add stardust.stardust_bat
data modify entity @s Glowing set value 1b
data modify entity @s Health set value 1f
team join stardust.team @s
