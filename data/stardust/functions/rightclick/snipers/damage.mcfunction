tag @s add StardustFragment_Shooted

execute store result score Absorption StardustFragment_Data run data get entity @s AbsorptionAmount 1
execute unless score Absorption StardustFragment_Data matches 1.. run function stardust:rightclick/snipers/health
execute if score Absorption StardustFragment_Data matches 1.. run function stardust:rightclick/snipers/absorption

execute as @s[type=ender_dragon] run summon minecraft:creeper ~ ~2 ~ {Fuse:0,ignited:1b,ExplosionRadius:2b,Tags:["StardustFragment_Shooted"]}
execute as @s[type=wither] run summon minecraft:creeper ~ ~2 ~ {Fuse:0,ignited:1b,ExplosionRadius:2b,Tags:["StardustFragment_Shooted"]}

effect give @s minecraft:instant_damage 1 0 true
effect give @s minecraft:instant_health 1 0 true
#Angry
	data modify entity @s AngryAt set from entity @a[tag=Shooter,limit=1] UUID
