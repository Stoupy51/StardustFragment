
tag @s remove stardust.working_portal

tag @s[tag=stardust.infinite_energy] add stardust.working_portal
tag @s[tag=stardust.cavern_portal,scores={energy.storage=20..}] add stardust.working_portal
tag @s[tag=stardust.celestial_portal,scores={energy.storage=20..}] add stardust.working_portal
tag @s[tag=stardust.stardust_portal,scores={energy.storage=100..}] add stardust.working_portal
tag @s[tag=stardust.stardust_dungeon_portal,scores={energy.storage=200..}] add stardust.working_portal
tag @s[tag=stardust.ultimate_portal,scores={energy.storage=500..}] add stardust.working_portal

scoreboard players remove @s[tag=stardust.cavern_portal,tag=stardust.working_portal,tag=!stardust.infinite_energy] energy.storage 20
scoreboard players remove @s[tag=stardust.celestial_portal,tag=stardust.working_portal,tag=!stardust.infinite_energy] energy.storage 20
scoreboard players remove @s[tag=stardust.stardust_portal,tag=stardust.working_portal,tag=!stardust.infinite_energy] energy.storage 100
scoreboard players remove @s[tag=stardust.stardust_dungeon_portal,tag=stardust.working_portal,tag=!stardust.infinite_energy] energy.storage 200
scoreboard players remove @s[tag=stardust.ultimate_portal,tag=stardust.working_portal,tag=!stardust.infinite_energy] energy.storage 500

execute at @s[tag=stardust.working_portal] positioned ~ ~1 ~ run scoreboard players add @a[distance=..1,dx=0] stardust.data 10
