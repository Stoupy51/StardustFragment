summon fireball ~ ~ ~ {ExplosionPower:8,NoGravity:1,Tags:["stardust.to_throw","stardust.thrown","stardust.always_aiming"]}
execute at @e[type=fireball,tag=stardust.to_throw] run tp @e[type=fireball,tag=stardust.to_throw,limit=1,sort=nearest] ~ ~ ~ facing entity @s eyes
execute as @e[type=fireball,tag=stardust.to_throw] at @s run function stardust:boss/aim
execute as @a[distance=0..] at @s run playsound entity.ghast.shoot hostile @s
