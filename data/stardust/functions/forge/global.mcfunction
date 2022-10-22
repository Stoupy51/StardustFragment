
scoreboard players add @s stardust.forge_craft 4
scoreboard players remove @s[scores={stardust.forge_craft=1..}] stardust.forge_craft 3
scoreboard players reset @s[scores={stardust.forge_craft=..0}] stardust.forge_craft
execute if entity @s[scores={stardust.forge_craft=1}] run playsound stardust:craft ambient @a[distance=..20]

