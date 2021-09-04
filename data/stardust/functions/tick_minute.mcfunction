#Others
	scoreboard players set Minute SF_Data 0
	scoreboard players set StardustPillar SF_Data 0
	execute as @e[type=wither,tag=SF_StardustPillar] run scoreboard players add StardustPillar SF_Data 1
	execute as @e[type=glow_item_frame,tag=SF_CobblestoneMiner] at @s positioned ~ ~-1 ~ if block ~ ~ ~ minecraft:cobblestone run function stardust:work/cobblestone_miner

#Dog Excrements
	execute as @e[type=wolf] run scoreboard players add @e[type=wolf,limit=1,sort=random] SF_Wolfs 1
	execute at @e[type=wolf,scores={SF_Wolfs=10..}] run summon item ~ ~ ~ {Item:{id:"minecraft:cobblestone",Count:64b,tag:{SF_Give:1b}}}
	execute as @e[type=item,nbt={Item:{tag:{SF_Give:1b}}}] run data modify entity @s Item set from storage stardust:items 2013011
	scoreboard players remove @e[type=wolf,scores={SF_Wolfs=10..}] SF_Wolfs 10

#Seeds
	execute as @e[type=glow_item_frame,tag=SF_Seed] at @s run function stardust:opti/seeds
