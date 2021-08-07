function stardust:ultimatecraft/verif
execute at @e[type=item,nbt={Item:{Count:32b,tag:{C:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=item,nbt={Item:{Count:1b,tag:{7C:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=item,nbt={Item:{Count:64b,tag:{ASB:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=item,nbt={Item:{tag:{JT:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=item,nbt={Item:{tag:{JS:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=item,nbt={Item:{Count:2b,tag:{SCStar:1b}}},limit=1,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1

scoreboard players add @s[scores={x=3}] SF_SCraft 6
scoreboard players remove @s[scores={SF_SCraft=0..}] SF_SCraft 5
scoreboard players reset @s[scores={SF_SCraft=..0}] SF_SCraft

execute as @s[scores={SF_SCraft=10..}] run summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:netherite_leggings",Count:1b,tag:{Unbreakable:1b,JUlt:1b,AttributeModifiers:[{AttributeName:"generic.movement_speed",Name:"generic.movement_speed",Slot:"legs",Amount:0.050,Operation:0,UUID:[I;3,3,3,3]},{AttributeName:"generic.armor",Name:"generic.armor",Slot:"legs",Amount:16,Operation:0,UUID:[I;3,3,3,4]},{AttributeName:"generic.armor_toughness",Name:"generic.armor_toughness",Slot:"legs",Amount:8,Operation:0,UUID:[I;3,3,4,4]}],HideFlags:126,display:{Lore:['{"text":" "}','[{"text":"[+50% de vitesse de base]","color":"white","italic":false}]'],Name:'[{"text":"Jambières Ultimes","color":"dark_red","italic":false}]'},Enchantments:[{lvl:10,id:"minecraft:protection"},{lvl:10,id:"minecraft:fire_protection"},{lvl:10,id:"minecraft:projectile_protection"},{lvl:10,id:"minecraft:blast_protection"}]}}}
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=item,nbt={Item:{Count:32b,tag:{C:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=item,nbt={Item:{Count:1b,tag:{7C:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=item,nbt={Item:{Count:64b,tag:{ASB:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=item,nbt={Item:{tag:{JT:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=item,nbt={Item:{tag:{JS:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=item,nbt={Item:{Count:2b,tag:{SCStar:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run playsound block.anvil.use block @a[distance=..25]
execute as @s[scores={SF_SCraft=10..}] run particle smoke ~ ~ ~ 0.4 0.4 0.4 0.2 1000
execute as @s[scores={SF_SCraft=10..}] run tellraw @a ["",{"text":"\n[Stardust","color":"dark_aqua"},{"text":"Fragment] ","color":"aqua"},{"selector":"@p"},{"text":" vient de crafter des Jambières "},{"text":"U","color":"dark_purple"},{"text":"l","color":"blue"},{"text":"t","color":"dark_aqua"},{"text":"i","color":"aqua"},{"text":"m","color":"green"},{"text":"e","color":"yellow"},{"text":"s","color":"gold"},{"text":" !\n"}]
kill @s[scores={SF_SCraft=10..}]
scoreboard players reset * x