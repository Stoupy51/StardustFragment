summon fireball ~ ~ ~ {ExplosionPower:8,NoGravity:1,Tags:["toThrow","Thrown","SF_AlwaysAiming"]}
execute at @e[type=fireball,tag=toThrow] run tp @e[type=fireball,tag=toThrow,limit=1,sort=nearest] ~ ~ ~ facing entity @s eyes
execute as @e[type=fireball,tag=toThrow] at @s run function stardust:boss/aim
execute as @a[distance=0..] at @s run playsound entity.ghast.shoot hostile @s