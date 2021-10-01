scoreboard players add @s SF_SCraft 4
scoreboard players remove @s[scores={SF_SCraft=1..}] SF_SCraft 3
scoreboard players reset @s[scores={SF_SCraft=..0}] SF_SCraft
execute as @s[scores={SF_SCraft=1}] run playsound stardust:craft master @a[distance=..20]
