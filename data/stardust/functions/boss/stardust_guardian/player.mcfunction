tp @s 81.0 169.2 -51.0
execute unless entity @e[type=wither_skeleton,tag=StardustFragment_StardustGuardian,distance=..200] run summon wither_skeleton 68.0 169.69 -31 {CustomName:'{"text":"Stardust Guardian","italic":false,"color":"red"}',CustomNameVisible:1,PersistenceRequired:1b,Glowing:1,Health:1024,Silent:1,DeathLootTable:"none",Team:"StardustFragment_Stardust",Tags:["StardustFragment_StardustGuardian","StardustFragment_StardustGuardianSpawn"]}
execute as @e[type=wither_skeleton,tag=StardustFragment_StardustGuardianSpawn] run function stardust:boss/stardust_guardian/spawn
