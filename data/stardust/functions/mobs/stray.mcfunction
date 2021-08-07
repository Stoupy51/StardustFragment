summon minecraft:stray ~ ~ ~ {DeathLootTable:"none",Health:50,Attributes:[{Name:"generic.max_health",Base:50},{Name:"generic.attack_damage",Base:8},{Name:"generic.movement_speed",Base:0.32f}],ArmorItems:[{},{},{},{}],ArmorDropChances:[0.1F,0.05F,0.025F,0F],Tags:["SF_StardustDim","SF_NewMob","SF_ToThrow"],Team:"SF_Stardust"}
data modify entity @e[type=minecraft:stray,tag=SF_NewMob,limit=1] ArmorItems[0] set from storage stardust:items 2013001
data modify entity @e[type=minecraft:stray,tag=SF_NewMob,limit=1] ArmorItems[1] set from storage stardust:items 2013001
data modify entity @e[type=minecraft:stray,tag=SF_NewMob,limit=1] ArmorItems[2] set from storage stardust:items 2013001
tag @e[type=minecraft:stray,tag=SF_NewMob,limit=1] remove SF_NewMob
