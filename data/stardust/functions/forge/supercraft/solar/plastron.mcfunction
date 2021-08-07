function stardust:supercraft/verif
execute at @e[type=item,nbt={Item:{Count:1b,tag:{ASB:1b}}},limit=1,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1

scoreboard players add @s[scores={x=3}] SF_SCraft 6
scoreboard players remove @s[scores={SF_SCraft=0..}] SF_SCraft 5
scoreboard players reset @s[scores={SF_SCraft=..0}] SF_SCraft

execute as @s[scores={SF_SCraft=5..}] run summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:leather_chestplate",Count:1b,tag:{Unbreakable:1b,PS:1b,AttributeModifiers:[{AttributeName:"generic.knockback_resistance",Name:"generic.knockback_resistance",Slot:"chest",Amount:5,Operation:0,UUID:[I;2,2,2,2]},{AttributeName:"generic.armor",Name:"generic.armor",Slot:"chest",Amount:9,Operation:0,UUID:[I;2,2,2,3]},{AttributeName:"generic.armor_toughness",Name:"generic.armor_toughness",Slot:"chest",Amount:3,Operation:0,UUID:[I;2,2,3,3]}],HideFlags:126,display:{"color":16753920,Lore:['{"text":" "}','[{"text":"[+5 Résistance au recul]","color":"white","italic":false}]'],Name:'[{"text":"Plastron Solaire","color":"gold","italic":false}]'},Enchantments:[{lvl:10,id:"minecraft:fire_protection"},{lvl:6,id:"minecraft:protection"},{lvl:6,id:"minecraft:projectile_protection"},{lvl:6,id:"minecraft:blast_protection"},{lvl:6,id:"minecraft:thorns"}]}}}
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=item,nbt={Item:{Count:1b,tag:{PO:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=item,nbt={Item:{Count:1b,tag:{ASB:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run playsound block.anvil.use block @a[distance=..25]
execute as @s[scores={SF_SCraft=5..}] run particle smoke ~ ~ ~ 0.4 0.4 0.4 0.2 1000
kill @s[scores={SF_SCraft=5..}]
scoreboard players reset * x