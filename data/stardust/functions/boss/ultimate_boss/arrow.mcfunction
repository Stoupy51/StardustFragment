
summon arrow ~ ~5 ~ {crit:0,damage:8,NoGravity:1,Tags:["stardust.to_throw","stardust.thrown","stardust.always_aiming"]}
summon arrow ~5 ~ ~5 {crit:0,damage:8,NoGravity:1,Tags:["stardust.to_throw","stardust.thrown","stardust.always_aiming"]}
summon arrow ~-5 ~ ~5 {crit:0,damage:8,NoGravity:1,Tags:["stardust.to_throw","stardust.thrown","stardust.always_aiming"]}
summon arrow ~-5 ~ ~-5 {crit:0,damage:8,NoGravity:1,Tags:["stardust.to_throw","stardust.thrown","stardust.always_aiming"]}
summon arrow ~-5 ~ ~5 {crit:0,damage:8,NoGravity:1,Tags:["stardust.to_throw","stardust.thrown","stardust.always_aiming"]}
team join stardust.team @e[type=arrow,tag=stardust.to_throw]
execute at @e[type=arrow,tag=stardust.to_throw] run tp @e[type=arrow,tag=stardust.to_throw,limit=1,sort=nearest] ~ ~ ~ facing entity @s eyes
execute as @e[type=arrow,tag=stardust.to_throw] at @s run function stardust:boss/aim
