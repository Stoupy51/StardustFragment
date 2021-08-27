function stardust:ultimatecraft/verif
execute at @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{8C:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{ArtHpMax:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{ArtDmgMax:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{ArtSpeedMax:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{Count:16b,tag:{C:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{Count:32b,tag:{EDP:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{id:"minecraft:dragon_egg",Count:16b}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{id:"minecraft:beacon",Count:64b}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{id:"minecraft:crying_obsidian",Count:64b}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{id:"minecraft:netherite_block",Count:1b}},limit=1,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1
execute at @e[type=minecraft:item,nbt={Item:{Count:64b,tag:{ASB:1b}}},limit=4,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1
execute at @e[type=minecraft:item,nbt={Item:{id:"minecraft:golden_apple",Count:64b}},limit=2,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1
execute at @e[type=minecraft:item,nbt={Item:{id:"minecraft:golden_carrot",Count:64b}},limit=2,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1
execute at @e[type=minecraft:item,nbt={Item:{id:"minecraft:nether_star",Count:64b}},limit=2,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1

scoreboard players add @s[scores={x=13}] SF_SCraft 6
scoreboard players remove @s[scores={SF_SCraft=0..}] SF_SCraft 5
scoreboard players reset @s[scores={SF_SCraft=..0}] SF_SCraft

execute as @s[scores={SF_SCraft=10..}] run summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:diamond",Count:1b,tag:{ArtUlt:1b,AttributeModifiers:[{AttributeName:"generic.max_health",Name:"generic.max_health",Amount:0.5,Operation:1,UUID:[I;10,10,10,10]},{AttributeName:"generic.attack_damage",Name:"generic.attack_damage",Amount:0.5,Operation:1,UUID:[I;20,20,20,20]},{AttributeName:"generic.movement_speed",Name:"generic.movement_speed",Amount:0.025,Operation:0,UUID:[I;30,30,30,30]}],HideFlags:127,display:{Lore:['{"text":" "}','[{"text":"[+50% de Dégâts]","italic":false,"color":"white"}]','[{"text":"[+50% de Points de vie]","italic":false,"color":"white"}]','[{"text":"[+25% de Vitesse de base]","italic":false,"color":"white"}]'],Name:'[{"text":"Artefact Ultime","italic":false,"color":"dark_red"}]'}}}}
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{8C:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{ArtHpMax:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{ArtDmgMax:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{ArtSpeedMax:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{Count:16b,tag:{C:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{Count:32b,tag:{EDP:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:dragon_egg",Count:16b}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:beacon",Count:64b}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:crying_obsidian",Count:64b}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:netherite_block",Count:1b}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{Count:64b,tag:{ASB:1b}}},limit=4,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:golden_apple",Count:64b}},limit=2,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:golden_carrot",Count:64b}},limit=2,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:nether_star",Count:64b}},limit=2,sort=nearest,distance=..1]

execute as @s[scores={SF_SCraft=10..}] run playsound entity.wither.spawn block @a
execute as @s[scores={SF_SCraft=10..}] run particle smoke ~ ~ ~ 0.4 0.4 0.4 0.2 1000
execute as @s[scores={SF_SCraft=10..}] run tellraw @a ["",{"text":"\n[Stardust","italic":false,"color":"dark_aqua"},{"text":"Fragment] ","italic":false,"color":"aqua"},{"selector":"@p"},{"text":" vient de crafter l'Artefact "},{"text":"U","italic":false,"color":"dark_purple"},{"text":"l","italic":false,"color":"blue"},{"text":"t","italic":false,"color":"dark_aqua"},{"text":"i","italic":false,"color":"aqua"},{"text":"m","italic":false,"color":"green"},{"text":"e","italic":false,"color":"yellow"},{"text":" ","italic":false,"color":"gold"},{"text":"!\n"}]
kill @s[scores={SF_SCraft=10..}]
scoreboard players reset * x