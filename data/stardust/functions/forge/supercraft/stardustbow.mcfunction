function stardust:supercraft/verif
execute at @e[type=item,nbt={Item:{id:"minecraft:bow",Count:1b}},limit=1,sort=nearest,distance=..1] at @e[type=item,nbt={Item:{id:"minecraft:diamond_block",Count:16b}},limit=1,sort=nearest,distance=..1] at @e[type=item,nbt={Item:{id:"minecraft:emerald_block",Count:16b}},limit=1,sort=nearest,distance=..1] at @e[type=item,nbt={Item:{Count:1b,tag:{E:1b}}},limit=1,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1

scoreboard players add @s[scores={x=3}] SF_SCraft 6
scoreboard players remove @s[scores={SF_SCraft=0..}] SF_SCraft 5
scoreboard players reset @s[scores={SF_SCraft=..0}] SF_SCraft

execute as @s[scores={SF_SCraft=5..}] run kill @e[type=item,nbt={Item:{id:"minecraft:bow",Count:1b}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=item,nbt={Item:{id:"minecraft:diamond_block",Count:16b}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=item,nbt={Item:{id:"minecraft:emerald_block",Count:16b}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=item,nbt={Item:{Count:1b,tag:{E:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run playsound block.anvil.use block @a[distance=..25]
execute as @s[scores={SF_SCraft=5..}] run particle smoke ~ ~ ~ 0.4 0.4 0.4 0.2 1000
execute as @s[scores={SF_SCraft=5..}] run summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:bow",Count:1b,tag:{SBow:1b,HideFlags:126,display:{Name:'[{"text":"Stardust Bow","italic":false,"color":"aqua"}]'},Enchantments:[{lvl:10,id:"minecraft:power"},{lvl:5,id:"minecraft:unbreaking"}]}}}
kill @s[scores={SF_SCraft=5..}]
scoreboard players reset * x