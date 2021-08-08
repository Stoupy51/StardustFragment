execute if score @s SF_StatQ matches 1 run function stardust:quarry/working/start
#Check Size
    execute if score @s SF_SizeQ matches 200001.. run tellraw @a[distance=..3] [{"text":"ERROR: More than 200k blocks","color":"red"}]
    scoreboard players set @s[scores={SF_SizeQ=200001..}] SF_StatQ 0
    scoreboard players add @s SF_SpeedQ 0
    execute if entity @s[scores={SF_StatQ=2},tag=!SF_QuarryLv2,tag=!SF_QuarryLv3,tag=!SF_QuarryLv4,tag=!SF_QuarryLv5,tag=!SF_QuarryLv6] at @s run function stardust:quarry/working/pos
    execute if entity @s[scores={SF_StatQ=2},tag=!SF_QuarryLv3,tag=!SF_QuarryLv4,tag=!SF_QuarryLv5,tag=!SF_QuarryLv6] at @s run function stardust:quarry/working/pos
    execute if entity @s[scores={SF_StatQ=2},tag=!SF_QuarryLv4,tag=!SF_QuarryLv5,tag=!SF_QuarryLv6] at @s run function stardust:quarry/working/pos
    execute if entity @s[scores={SF_StatQ=2},tag=!SF_QuarryLv5,tag=!SF_QuarryLv6] at @s run function stardust:quarry/working/pos
    execute if entity @s[scores={SF_StatQ=2},tag=!SF_QuarryLv6] at @s run function stardust:quarry/working/pos
    execute if entity @s[scores={SF_StatQ=2},tag=SF_QuarryLv6] at @e[limit=50] at @s run function stardust:quarry/working/pos
