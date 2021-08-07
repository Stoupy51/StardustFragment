summon minecraft:fireball ~ ~ ~ {ExplosionPower:8,NoGravity:1,Tags:["SF_ToThrow","SF_Thrown","SF_AlwaysAiming"]}
execute at @e[type=minecraft:fireball,tag=SF_ToThrow] run tp @e[type=minecraft:fireball,tag=SF_ToThrow,limit=1,sort=nearest] ~ ~ ~ facing entity @s eyes
execute as @e[type=minecraft:fireball,tag=SF_ToThrow] at @s run function stardust:boss/aim
execute as @a[distance=0..] at @s run playsound minecraft:entity.ghast.shoot hostile @s
