data modify entity @s CustomName set value '{"text":"Stardust Pillar (Shield Off)","italic":false,"color":"aqua"}'
data modify entity @s NoAI set value 0b
data modify entity @s Attributes set value [{Name:"generic.max_health",Base:1024}]
data modify entity @s Health set value 1024
data modify entity @s Invulnerable set value 0
tag @s remove stardust.has_shield
playsound minecraft:entity.ender_dragon.growl hostile @a[distance=..200]
scoreboard players reset @s
