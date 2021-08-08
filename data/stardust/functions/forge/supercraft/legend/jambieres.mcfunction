function stardust:supercraft/verif
execute at @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{ASB:1b}}},limit=1,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1

scoreboard players add @s[scores={x=3}] SF_SCraft 6
scoreboard players remove @s[scores={SF_SCraft=0..}] SF_SCraft 5
scoreboard players reset @s[scores={SF_SCraft=..0}] SF_SCraft

execute as @s[scores={SF_SCraft=5..}] run summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:leather_leggings",Count:1b,tag:{Unbreakable:1b,JL:1b,AttributeModifiers:[{AttributeName:"generic.movement_speed",Name:"generic.movement_speed",Slot:"legs",Amount:0.03,Operation:0,UUID:[I;3,3,3,3]},{AttributeName:"generic.armor",Name:"generic.armor",Slot:"legs",Amount:6,Operation:0,UUID:[I;3,3,3,4]},{AttributeName:"generic.armor_toughness",Name:"generic.armor_toughness",Slot:"legs",Amount:2,Operation:0,UUID:[I;3,3,4,4]}],HideFlags:126,display:{"color":65280,Lore:['{"text":" "}','[{"text":"[+30% de vitesse de base]","color":"white","italic":false}]'],Name:'[{"text":"Jambières Légendaires","color":"green","italic":false}]'},Enchantments:[{lvl:5,id:"minecraft:protection"},{lvl:5,id:"minecraft:projectile_protection"},{lvl:5,id:"minecraft:blast_protection"}]}}}
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{JO:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{ASB:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run playsound block.anvil.use block @a[distance=..25]
execute as @s[scores={SF_SCraft=5..}] run particle smoke ~ ~ ~ 0.4 0.4 0.4 0.2 1000
kill @s[scores={SF_SCraft=5..}]
scoreboard players reset * x