function stardust:supercraft/verif
execute at @e[type=item,nbt={Item:{id:"minecraft:shears",Count:1b}},limit=1,sort=nearest,distance=..1] at @e[type=item,nbt={Item:{id:"minecraft:iron_block",Count:64b}},limit=1,sort=nearest,distance=..1] at @e[type=item,nbt={Item:{Count:2b,tag:{DP:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=item,nbt={Item:{Count:16b,tag:{AS:1b}}},limit=1,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1

scoreboard players add @s[scores={x=3}] SF_SCraft 6
scoreboard players remove @s[scores={SF_SCraft=0..}] SF_SCraft 5
scoreboard players reset @s[scores={SF_SCraft=..0}] SF_SCraft

execute as @s[scores={SF_SCraft=5..}] run kill @e[type=item,nbt={Item:{id:"minecraft:shears",Count:1b}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=item,nbt={Item:{id:"minecraft:iron_block",Count:64b}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=item,nbt={Item:{Count:2b,tag:{DP:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=item,nbt={Item:{Count:16b,tag:{AS:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run playsound block.anvil.use block @a[distance=..25]
execute as @s[scores={SF_SCraft=5..}] run particle smoke ~ ~ ~ 0.4 0.4 0.4 0.2 1000
execute as @s[scores={SF_SCraft=5..}] run summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:shears",Count:1b,tag:{Unbreakable:1b,AItem:1b,HideFlags:127,display:{Lore:['[{"text":"Effets dans l\'autre main :","italic":false,"color":"white"}]','[{"text":"[Permet d\'attirer tous les items","italic":false,"color":"gray"}]','[{"text":"dans un rayon de 4 blocs]","italic":false,"color":"gray"}]'],Name:'[{"text":"Aimant à Item","color":"aqua","italic":false}]'},Enchantments:[{lvl:0,id:"minecraft:protection"}]}}}
kill @s[scores={SF_SCraft=5..}]
scoreboard players reset * x