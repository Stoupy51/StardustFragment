
tag @s add stardust.shooted

execute store result score #absorption stardust.data run data get entity @s AbsorptionAmount 1
execute unless score #absorption stardust.data matches 1.. run function stardust:right_click/snipers/health
execute if score #absorption stardust.data matches 1.. run function stardust:right_click/snipers/absorption

execute if entity @s[type=ender_dragon] run summon creeper ~ ~2 ~ {Fuse:0,ignited:1b,ExplosionRadius:2b,Tags:["stardust.shooted"]}
execute if entity @s[type=wither] run summon creeper ~ ~2 ~ {Fuse:0,ignited:1b,ExplosionRadius:2b,Tags:["stardust.shooted"]}

scoreboard players operation @s[type=player] smithed.damage = #bullet_damage stardust.data
execute if entity @s[type=player] run function #smithed.damage:entity/apply/projectile

effect give @s instant_damage 1 0 true
effect give @s instant_health 1 0 true
#Angry
	data modify entity @s AngryAt set from entity @a[tag=stardust.shooter,limit=1] UUID