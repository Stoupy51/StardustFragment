
summon arrow ~ ~5 ~ {crit:0,damage:10,NoGravity:1,Tags:["stardust.to_throw","stardust.thrown","stardust.always_aiming"]}
summon arrow ~5 ~ ~5 {crit:0,damage:10,NoGravity:1,Tags:["stardust.to_throw","stardust.thrown","stardust.always_aiming"]}
summon arrow ~-5 ~ ~5 {crit:0,damage:10,NoGravity:1,Tags:["stardust.to_throw","stardust.thrown","stardust.always_aiming"]}
summon arrow ~-5 ~ ~-5 {crit:0,damage:10,NoGravity:1,Tags:["stardust.to_throw","stardust.thrown","stardust.always_aiming"]}
summon arrow ~-5 ~ ~5 {crit:0,damage:10,NoGravity:1,Tags:["stardust.to_throw","stardust.thrown","stardust.always_aiming"]}
execute as @e[type=arrow,tag=stardust.to_throw] run team join stardust.team @s
execute at @e[type=arrow,tag=stardust.to_throw] run tp @e[type=arrow,tag=stardust.to_throw,limit=1,sort=nearest] ~ ~ ~ facing entity @s eyes
execute as @e[type=arrow,tag=stardust.to_throw] at @s run function stardust:boss/aim
