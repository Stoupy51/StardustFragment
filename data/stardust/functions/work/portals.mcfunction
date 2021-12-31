tag @s remove SF_WorkingPortal
tag @s[tag=SF_InfiniteEnergy] add SF_WorkingPortal
tag @s[tag=SF_CavernPortal,scores={energy.storage=20..}] add SF_WorkingPortal
tag @s[tag=SF_CelestialPortal,scores={energy.storage=20..}] add SF_WorkingPortal
tag @s[tag=SF_StardustPortal,scores={energy.storage=100..}] add SF_WorkingPortal
tag @s[tag=SF_DungeonPortal,scores={energy.storage=200..}] add SF_WorkingPortal
tag @s[tag=SF_UltimatePortal,scores={energy.storage=500..}] add SF_WorkingPortal
scoreboard players remove @s[tag=SF_CavernPortal,tag=SF_WorkingPortal,tag=!SF_InfiniteEnergy] energy.storage 20
scoreboard players remove @s[tag=SF_CelestialPortal,tag=SF_WorkingPortal,tag=!SF_InfiniteEnergy] energy.storage 20
scoreboard players remove @s[tag=SF_StardustPortal,tag=SF_WorkingPortal,tag=!SF_InfiniteEnergy] energy.storage 100
scoreboard players remove @s[tag=SF_DungeonPortal,tag=SF_WorkingPortal,tag=!SF_InfiniteEnergy] energy.storage 200
scoreboard players remove @s[tag=SF_UltimatePortal,tag=SF_WorkingPortal,tag=!SF_InfiniteEnergy] energy.storage 500
execute at @s[tag=SF_WorkingPortal] positioned ~ ~1 ~ run scoreboard players add @a[distance=..1,dx=0] SF_Data 10
