tag @s remove StardustFragment_WorkingPortal
tag @s[tag=StardustFragment_InfiniteEnergy] add StardustFragment_WorkingPortal
tag @s[tag=StardustFragment_CavernPortal,scores={energy.storage=20..}] add StardustFragment_WorkingPortal
tag @s[tag=StardustFragment_CelestialPortal,scores={energy.storage=20..}] add StardustFragment_WorkingPortal
tag @s[tag=StardustFragment_StardustPortal,scores={energy.storage=100..}] add StardustFragment_WorkingPortal
tag @s[tag=StardustFragment_DungeonPortal,scores={energy.storage=200..}] add StardustFragment_WorkingPortal
tag @s[tag=StardustFragment_UltimatePortal,scores={energy.storage=500..}] add StardustFragment_WorkingPortal
scoreboard players remove @s[tag=StardustFragment_CavernPortal,tag=StardustFragment_WorkingPortal,tag=!StardustFragment_InfiniteEnergy] energy.storage 20
scoreboard players remove @s[tag=StardustFragment_CelestialPortal,tag=StardustFragment_WorkingPortal,tag=!StardustFragment_InfiniteEnergy] energy.storage 20
scoreboard players remove @s[tag=StardustFragment_StardustPortal,tag=StardustFragment_WorkingPortal,tag=!StardustFragment_InfiniteEnergy] energy.storage 100
scoreboard players remove @s[tag=StardustFragment_DungeonPortal,tag=StardustFragment_WorkingPortal,tag=!StardustFragment_InfiniteEnergy] energy.storage 200
scoreboard players remove @s[tag=StardustFragment_UltimatePortal,tag=StardustFragment_WorkingPortal,tag=!StardustFragment_InfiniteEnergy] energy.storage 500
execute at @s[tag=StardustFragment_WorkingPortal] positioned ~ ~1 ~ run scoreboard players add @a[distance=..1,dx=0] StardustFragment_Data 10
