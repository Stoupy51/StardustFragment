
tag @s add stardust.shooted

#Resistance effect support
execute if entity @s[type=!player] run function stardust:right_click/snipers/resistance

scoreboard players reset #absorption stardust.data
execute store result score #absorption stardust.data run data get entity @s AbsorptionAmount 1
execute unless score #absorption stardust.data matches 1.. run function stardust:right_click/snipers/health
execute if score #absorption stardust.data matches 1.. run function stardust:right_click/snipers/absorption

execute if entity @s[type=ender_dragon] run summon creeper ~ ~2 ~ {Fuse:0,ignited:1b,ExplosionRadius:2b,Tags:["stardust.shooted"]}
execute if entity @s[type=wither] run summon creeper ~ ~2 ~ {Fuse:0,ignited:1b,ExplosionRadius:2b,Tags:["stardust.shooted"]}
execute if entity @s[type=end_crystal] run summon tnt

scoreboard players operation @s[type=player] smithed.damage = #bullet_damage stardust.data
execute if entity @s[type=player] run function #smithed.damage:entity/apply/projectile
execute if entity @s[type=player] run function #durability_multiplier:v1/durability_changed

effect give @s instant_damage 1 0 true
effect give @s[type=!player] instant_health 1 0 true

#Angry
	data modify entity @s AngryAt set from entity @a[tag=stardust.shooter,limit=1] UUID
