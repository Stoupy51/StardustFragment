function stardust:supercraft/verif
execute at @e[type=item,nbt={Item:{Count:1b,tag:{AS:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=item,nbt={Item:{id:"minecraft:netherite_block",Count:8b}},limit=1,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1

scoreboard players add @s[scores={x=3}] SF_SCraft 6
scoreboard players remove @s[scores={SF_SCraft=0..}] SF_SCraft 5
scoreboard players reset @s[scores={SF_SCraft=..0}] SF_SCraft

execute as @s[scores={SF_SCraft=5..}] run summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:netherite_shovel",Count:1b,tag:{Unbreakable:1,SPTeuse:1b,HideFlags:126,display:{Name:'[{"text":"Super Pelle Teuse","italic":false,"color":"yellow"}]'},Enchantments:[{lvl:10,id:"minecraft:efficiency"},{lvl:1,id:"minecraft:silk_touch"}]}}}
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=item,nbt={Item:{Count:1b,tag:{AS:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run kill @e[type=item,nbt={Item:{id:"minecraft:netherite_block",Count:8b}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=5..}] run playsound block.anvil.use block @a[distance=..25]
execute as @s[scores={SF_SCraft=5..}] run particle smoke ~ ~ ~ 0.4 0.4 0.4 0.2 1000
kill @s[scores={SF_SCraft=5..}]
scoreboard players reset * x