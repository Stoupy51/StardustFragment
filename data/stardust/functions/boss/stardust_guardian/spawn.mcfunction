data modify entity @s ArmorDropChances set value [1F,1F,2F,2F]
data modify entity @s ArmorItems set value [{},{},{},{}]
data modify entity @s ArmorItems[0] set from storage stardust:items 2013005
data modify entity @s ArmorItems[0].Count set value 36b
data modify entity @s ArmorItems[1] set from storage stardust:items 2013002
data modify entity @s ArmorItems[1].Count set value 32b

attribute @s minecraft:generic.knockback_resistance base set 1
attribute @s minecraft:generic.movement_speed base set 0.4
attribute @s minecraft:generic.attack_damage base set 32
attribute @s minecraft:generic.max_health base set 1024
data modify entity @s Health set value 2048
tag @s remove SF_StardustGuardianSpawn
