summon minecraft:arrow ~ ~5 ~ {crit:0,damage:10,NoGravity:1,Tags:["SF_ToThrow","SF_Thrown","SF_AlwaysAiming"]}
summon minecraft:arrow ~5 ~ ~5 {crit:0,damage:10,NoGravity:1,Tags:["SF_ToThrow","SF_Thrown","SF_AlwaysAiming"]}
summon minecraft:arrow ~-5 ~ ~5 {crit:0,damage:10,NoGravity:1,Tags:["SF_ToThrow","SF_Thrown","SF_AlwaysAiming"]}
summon minecraft:arrow ~-5 ~ ~-5 {crit:0,damage:10,NoGravity:1,Tags:["SF_ToThrow","SF_Thrown","SF_AlwaysAiming"]}
summon minecraft:arrow ~-5 ~ ~5 {crit:0,damage:10,NoGravity:1,Tags:["SF_ToThrow","SF_Thrown","SF_AlwaysAiming"]}
execute at @e[type=minecraft:arrow,tag=SF_ToThrow] run tp @e[type=minecraft:arrow,tag=SF_ToThrow,limit=1,sort=nearest] ~ ~ ~ facing entity @s eyes
execute as @e[type=minecraft:arrow,tag=SF_ToThrow] at @s run function stardust:boss/aim
