scoreboard players add @s StardustFragment_SCraft 4
scoreboard players remove @s[scores={StardustFragment_SCraft=1..}] StardustFragment_SCraft 3
scoreboard players reset @s[scores={StardustFragment_SCraft=..0}] StardustFragment_SCraft
execute as @s[scores={StardustFragment_SCraft=1}] run playsound stardust:craft master @a[distance=..20]
