function stardust:supercraft/verif
execute at @e[type=item,nbt={Item:{Count:1b,tag:{SCStar:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=item,nbt={Item:{Count:1b,tag:{5C:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=item,nbt={Item:{Count:1b,tag:{EDP:1b}}},limit=1,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1

scoreboard players add @s[scores={x=3}] SF_SCraft 6
scoreboard players remove @s[scores={SF_SCraft=0..}] SF_SCraft 5
scoreboard players reset @s[scores={SF_SCraft=..0}] SF_SCraft


execute as @s[scores={SF_SCraft=5..}] run summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:gold_nugget",Count:1b,tag:{ArtHpMax:1b,AttributeModifiers:[{AttributeName:"generic.max_health",Name:"generic.max_health",Amount:0.5,Operation:1,UUID:[I;10,10,10,10]}],HideFlags:127,display:{Lore:['{"text":" "}','[{"text":"[+50% de Points de vie]","italic":false,"color":"white"}]'],Name:'[{"text":"Artefact de vie Lv.Max","italic":false,"color":"red"}]'}}}}
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=item,nbt={Item:{Count:1b,tag:{SCStar:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=item,nbt={Item:{Count:1b,tag:{5C:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=item,nbt={Item:{Count:1b,tag:{EDP:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run playsound block.anvil.use block @a[distance=..25]
execute as @s[scores={SF_SCraft=5..}] run particle happy_villager ~ ~ ~ 0.4 0.4 0.4 0.2 100
kill @s[scores={SF_SCraft=5..}]
scoreboard players reset * x