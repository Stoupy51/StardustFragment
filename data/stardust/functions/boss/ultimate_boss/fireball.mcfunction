summon minecraft:fireball ~ ~ ~ {ExplosionPower:8,NoGravity:1,Tags:["StardustFragment_ToThrow","StardustFragment_Thrown","StardustFragment_AlwaysAiming"]}
execute at @e[type=fireball,tag=StardustFragment_ToThrow] run tp @e[type=fireball,tag=StardustFragment_ToThrow,limit=1,sort=nearest] ~ ~ ~ facing entity @s eyes
execute as @e[type=fireball,tag=StardustFragment_ToThrow] at @s run function stardust:boss/aim
execute as @a[distance=0..] at @s run playsound minecraft:entity.ghast.shoot hostile @s
