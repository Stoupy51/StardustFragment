data modify entity @s ArmorDropChances set value [1F,0.25F,0.5F,2F]
data modify entity @s ArmorItems set value [{},{},{},{}]
data modify entity @s ArmorItems[0] set from storage stardust:items 2013017
data modify entity @s ArmorItems[0].Count set value 56b
data modify entity @s ArmorItems[1] set value {id:"minecraft:diamond_block",Count:16b}
data modify entity @s ArmorItems[2] set from storage stardust:items 2013001
data modify entity @s ArmorItems[2].Count set value 8b

effect give @s jump_boost 99999 4 true
attribute @s generic.attack_damage modifier add 1-1-1-1-1 "1" 12.5 multiply_base
attribute @s generic.max_health modifier add 1-1-1-1-2 "2" 12.5 multiply_base
data modify entity @s Health set value 2048
tag @s remove SF_StoupArmy
execute as @e[limit=50] run summon wolf ~ ~ ~ {Tags:["SF_StoupArmyDrop","SF_DontShit"],Health:40,Attributes:[{Name:"generic.max_health",Base:40}],ArmorDropChances:[1F,0.5F,0.25F,0.1F],ArmorItems:[{},{},{},{}]}
execute as @e[type=wolf,tag=SF_StoupArmyDrop] run data modify entity @s ArmorItems[0] set from storage stardust:items 2013000
execute as @e[type=wolf,tag=SF_StoupArmyDrop] run data modify entity @s ArmorItems[1] set from storage stardust:items 2013000
execute as @e[type=wolf,tag=SF_StoupArmyDrop] run data modify entity @s ArmorItems[2] set from storage stardust:items 2013000
execute as @e[type=wolf,tag=SF_StoupArmyDrop] run data modify entity @s ArmorItems[3] set from storage stardust:items 2013000
execute as @e[type=wolf,tag=SF_StoupArmyDrop] run data modify entity @s ArmorItems[0].Count set value 3b
execute as @e[type=wolf,tag=SF_StoupArmyDrop] run data modify entity @s ArmorItems[1].Count set value 3b
execute as @e[type=wolf,tag=SF_StoupArmyDrop] run data modify entity @s ArmorItems[2].Count set value 3b
execute as @e[type=wolf,tag=SF_StoupArmyDrop] run data modify entity @s ArmorItems[3].Count set value 5b
tag @e[type=wolf,tag=SF_StoupArmyDrop] remove SF_StoupArmyDrop
