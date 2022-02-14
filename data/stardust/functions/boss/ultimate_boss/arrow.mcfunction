summon minecraft:arrow ~ ~5 ~ {crit:0,damage:10,NoGravity:1,Tags:["StardustFragment_ToThrow","StardustFragment_Thrown","StardustFragment_AlwaysAiming"]}
summon minecraft:arrow ~5 ~ ~5 {crit:0,damage:10,NoGravity:1,Tags:["StardustFragment_ToThrow","StardustFragment_Thrown","StardustFragment_AlwaysAiming"]}
summon minecraft:arrow ~-5 ~ ~5 {crit:0,damage:10,NoGravity:1,Tags:["StardustFragment_ToThrow","StardustFragment_Thrown","StardustFragment_AlwaysAiming"]}
summon minecraft:arrow ~-5 ~ ~-5 {crit:0,damage:10,NoGravity:1,Tags:["StardustFragment_ToThrow","StardustFragment_Thrown","StardustFragment_AlwaysAiming"]}
summon minecraft:arrow ~-5 ~ ~5 {crit:0,damage:10,NoGravity:1,Tags:["StardustFragment_ToThrow","StardustFragment_Thrown","StardustFragment_AlwaysAiming"]}
execute as @e[type=arrow,tag=StardustFragment_ToThrow] run team join StardustFragment_Stardust @s
execute at @e[type=arrow,tag=StardustFragment_ToThrow] run tp @e[type=arrow,tag=StardustFragment_ToThrow,limit=1,sort=nearest] ~ ~ ~ facing entity @s eyes
execute as @e[type=arrow,tag=StardustFragment_ToThrow] at @s run function stardust:boss/aim
