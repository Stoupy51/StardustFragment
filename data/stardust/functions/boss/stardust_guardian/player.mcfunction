
tp @s 81.0 169.2 -51.0
execute unless entity @e[type=wither_skeleton,tag=stardust.stardust_guardian,distance=..200] run summon wither_skeleton 68.0 169.69 -31 {CustomName:'{"text":"Stardust Guardian","italic":false,"color":"red"}',CustomNameVisible:1,PersistenceRequired:1b,Glowing:1,Health:1024,Silent:1,DeathLootTable:"stardust:entities/stardust_guardian",Team:"stardust.team",Tags:["stardust.stardust_guardian","stardust.stardust_guardian_spawn"]}
execute as @e[type=wither_skeleton,tag=stardust.stardust_guardian_spawn] run function stardust:boss/stardust_guardian/spawn
