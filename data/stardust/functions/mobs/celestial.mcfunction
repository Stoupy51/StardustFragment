data modify entity @s ArmorDropChances set value [2F,0.5F,0.25F,2F]
data modify entity @s ArmorItems set value [{},{},{},{}]
data modify entity @s ArmorItems[0] set from storage stardust:items 2013000
data modify entity @s ArmorItems[1] set from storage stardust:items 2013000
data modify entity @s ArmorItems[2] set from storage stardust:items 2013000
data modify entity @s ArmorItems[0].Count set value 1b
data modify entity @s ArmorItems[1].Count set value 2b
data modify entity @s ArmorItems[2].Count set value 3b
attribute @s minecraft:generic.attack_damage modifier add 1-1-1-1-1 1 2 multiply_base
attribute @s minecraft:generic.max_health modifier add 1-1-1-1-2 2 2 multiply_base
data modify entity @s Health set value 2048
tag @s add SF_CelestialDim