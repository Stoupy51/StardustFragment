function stardust:supercraft/verif
execute at @e[type=minecraft:item,nbt={Item:{id:"minecraft:dragon_egg",Count:8b}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{Count:64b,tag:{ASB:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{Count:12b,tag:{EDP:1b}}},limit=1,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1

scoreboard players add @s[scores={x=3}] SF_SCraft 6
scoreboard players remove @s[scores={SF_SCraft=0..}] SF_SCraft 5
scoreboard players reset @s[scores={SF_SCraft=..0}] SF_SCraft

execute as @s[scores={SF_SCraft=5..}] run summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:bow",Count:1b,tag:{ASBow:1b,HideFlags:127,display:{Lore:['[{"text":"Power L","italic":false,"color":"gray"}]','[{"text":"Looting X","italic":false,"color":"gray"}]','[{"text":"Unbreaking X","italic":false,"color":"gray"}]','[{"text":"Infinity","italic":false,"color":"gray"}]'],Name:'[{"text":"Awakened Stardust Bow","italic":false,"color":"red"}]'},Enchantments:[{lvl:50,id:"minecraft:power"},{lvl:10,id:"minecraft:looting"},{lvl:10,id:"minecraft:unbreaking"},{lvl:1,id:"minecraft:infinity"}]}}}
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:dragon_egg",Count:8b}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=minecraft:item,nbt={Item:{Count:64b,tag:{ASB:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=minecraft:item,nbt={Item:{Count:12b,tag:{EDP:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run playsound block.anvil.use block @a[distance=..25]
execute as @s[scores={SF_SCraft=5..}] run particle smoke ~ ~ ~ 0.4 0.4 0.4 0.2 1000
kill @s[scores={SF_SCraft=5..}]
scoreboard players reset * x