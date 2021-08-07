function stardust:supercraft/verif
execute at @e[type=minecraft:item,nbt={Item:{id:"minecraft:ender_pearl",Count:16b}},limit=4,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1
execute at @e[type=minecraft:item,nbt={Item:{id:"minecraft:dragon_breath",Count:16b}},limit=1,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1

scoreboard players add @s[scores={x=7}] SF_SCraft 6
scoreboard players remove @s[scores={SF_SCraft=0..}] SF_SCraft 5
scoreboard players reset @s[scores={SF_SCraft=..0}] SF_SCraft

execute as @s[scores={SF_SCraft=5..}] run summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:ender_eye",Count:1b,tag:{EDP:1b,HideFlags:127,display:{Lore:['[{"text":"Matériau primaire avancé utilisé pour","italic":false,"color":"white"}]','[{"text":"certains crafts de l\'Awakened Forge","italic":false,"color":"white"}]'],Name:'[{"text":"Ender ","italic":false,"color":"dark_aqua"},{"text":"Dragon Pearl","italic":false,"color":"dark_purple"}]'},Enchantments:[{lvl:0,id:"minecraft:protection"}]}}}
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:ender_pearl",Count:16b}},limit=4,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:dragon_breath",Count:16b}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run playsound block.anvil.use block @a[distance=..25]
execute as @s[scores={SF_SCraft=5..}] run particle smoke ~ ~ ~ 0.4 0.4 0.4 0.2 1000
kill @s[scores={SF_SCraft=5..}]
scoreboard players reset * x