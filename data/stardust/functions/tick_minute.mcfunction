#Others
	scoreboard players set Minute StardustFragment_Data 0
	
	execute store result score StardustPillar StardustFragment_Data if entity @e[type=wither,tag=StardustFragment_StardustPillar]
	execute as @e[type=glow_item_frame,tag=StardustFragment_CobblestoneMiner] at @s positioned ~ ~-1 ~ if block ~ ~ ~ minecraft:cobblestone run function stardust:work/cobblestone_miner

#Dog Excrements
	execute as @e[type=wolf,tag=!StardustFragment_DontShit] run scoreboard players add @e[type=wolf,limit=1,sort=random,tag=!StardustFragment_DontShit] StardustFragment_Wolfs 1
	execute at @e[type=wolf,tag=!StardustFragment_DontShit,scores={StardustFragment_Wolfs=10..}] run summon item ~ ~ ~ {Item:{id:"minecraft:cobblestone",Count:64b,tag:{StardustFragment_Give:1b}}}
	execute as @e[type=item,nbt={Item:{tag:{StardustFragment_Give:1b}}}] run data modify entity @s Item set from storage stardust:items all.2013011
	scoreboard players remove @e[type=wolf,scores={StardustFragment_Wolfs=10..}] StardustFragment_Wolfs 10

#Seeds
	execute as @e[type=glow_item_frame,tag=StardustFragment_Seed,tag=!StardustFragment_SeedDone] at @s run function stardust:opti/seeds
