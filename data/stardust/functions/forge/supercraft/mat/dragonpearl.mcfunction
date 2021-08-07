function stardust:supercraft/verif
execute at @e[type=minecraft:item,nbt={Item:{id:"minecraft:ender_pearl",Count:16b}},limit=2,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1
execute at @e[type=minecraft:item,nbt={Item:{id:"minecraft:dragon_breath",Count:64b}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{id:"minecraft:nether_star",Count:4b}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{Count:4b,tag:{L:1b}}},limit=1,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1

scoreboard players add @s[scores={x=5}] SF_SCraft 6
scoreboard players remove @s[scores={SF_SCraft=0..}] SF_SCraft 5
scoreboard players reset @s[scores={SF_SCraft=..0}] SF_SCraft

execute as @s[scores={SF_SCraft=5..}] run summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:ender_pearl",Count:1b,tag:{DP:1b,HideFlags:127,display:{Lore:['[{"text":"Matériau primaire utilisé pour","italic":false,"color":"white"}]','[{"text":"les crafts de l\'Awakened Forge","italic":false,"color":"white"}]'],Name:'[{"text":"Dragon Pearl","italic":false,"color":"dark_purple"}]'},Enchantments:[{lvl:0,id:"minecraft:protection"}]}}}
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:ender_pearl",Count:16b}},limit=2,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:dragon_breath",Count:64b}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:nether_star",Count:4b}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=minecraft:item,nbt={Item:{Count:4b,tag:{L:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run playsound block.anvil.use block @a[distance=..25]
execute as @s[scores={SF_SCraft=5..}] run particle smoke ~ ~ ~ 0.4 0.4 0.4 0.2 1000
kill @s[scores={SF_SCraft=5..}]
scoreboard players reset * x