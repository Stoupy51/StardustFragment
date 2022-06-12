#Others
	scoreboard players set #minute stardust.data 0
	
	execute store result score #stardust_pillar stardust.data if entity @e[type=wither,tag=stardust.stardust_pillar]
	execute as @e[type=glow_item_frame,tag=stardust.cobblestone_miner] at @s positioned ~ ~-1 ~ if block ~ ~ ~ minecraft:cobblestone run function stardust:work/cobblestone_miner

#Dog Excrements
	execute as @e[type=wolf,tag=!stardust.dont_shit] run scoreboard players add @e[type=wolf,limit=1,sort=random,tag=!stardust.dont_shit] stardust.wolfs 1
	execute at @e[type=wolf,tag=!stardust.dont_shit,scores={stardust.wolfs=10..}] run loot spawn ~ ~ ~ loot stardust:i/dog_excrement
	scoreboard players remove @e[type=wolf,scores={stardust.wolfs=10..}] stardust.wolfs 10

#Seeds
	execute as @e[type=glow_item_frame,tag=stardust.seed,tag=!stardust.seed_done] at @s run function stardust:utils/seeds
