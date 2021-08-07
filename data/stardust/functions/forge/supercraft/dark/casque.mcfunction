function stardust:supercraft/verif
execute at @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{ASB:1b}}},limit=1,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1

scoreboard players add @s[scores={x=3}] SF_SCraft 6
scoreboard players remove @s[scores={SF_SCraft=0..}] SF_SCraft 5
scoreboard players reset @s[scores={SF_SCraft=..0}] SF_SCraft

execute as @s[scores={SF_SCraft=5..}] run summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:leather_helmet",Count:1b,tag:{Unbreakable:1b,CT:1b,AttributeModifiers:[{AttributeName:"generic.max_health",Name:"generic.max_health",Slot:"head",Amount:60,Operation:0,UUID:[I;1,1,1,1]},{AttributeName:"generic.armor",Name:"generic.armor",Slot:"head",Amount:5,Operation:0,UUID:[I;1,1,1,2]},{AttributeName:"generic.armor_toughness",Name:"generic.armor_toughness",Slot:"head",Amount:4,Operation:0,UUID:[I;1,1,2,2]}],HideFlags:126,display:{"color":0,Lore:['{"text":" "}','[{"text":"[+60 Points de vie]","color":"white","italic":false}]'],Name:'[{"text":"Casque Ténébreux","color":"dark_gray","italic":false}]'},Enchantments:[{lvl:7,id:"minecraft:protection"},{lvl:7,id:"minecraft:projectile_protection"},{lvl:7,id:"minecraft:blast_protection"}]}}}
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{CO:1b}}},limit=1,sort=nearest,distance=..1] 
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{ASB:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run playsound block.anvil.use block @a[distance=..25]
execute as @s[scores={SF_SCraft=5..}] run particle smoke ~ ~ ~ 0.4 0.4 0.4 0.2 1000
kill @s[scores={SF_SCraft=5..}]
scoreboard players reset * x