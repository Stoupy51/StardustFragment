data modify entity @s ArmorDropChances set value [0.85F,0.60F,0.50F,2F]
data modify entity @s ArmorItems set value [{},{},{},{}]
data modify entity @s ArmorItems[0] set from storage stardust:items 2013004
data modify entity @s ArmorItems[1] set from storage stardust:items 2013004
data modify entity @s ArmorItems[2] set from storage stardust:items 2013004
data modify entity @s ArmorItems[3] set from storage stardust:items 2013002
data modify entity @s ArmorItems[0].Count set value 4b
data modify entity @s ArmorItems[1].Count set value 4b
data modify entity @s ArmorItems[2].Count set value 4b
data modify entity @s ArmorItems[3].Count set value 4b
data modify entity @s DeathLootTable set value "none"
attribute @s generic.attack_damage modifier add 1-1-1-1-1 1 2 multiply_base
attribute @s generic.max_health modifier add 1-1-1-1-2 2 4 multiply_base
data modify entity @s Health set value 2048
team join SF_Stardust @s
tag @s add SF_DungeonDim
