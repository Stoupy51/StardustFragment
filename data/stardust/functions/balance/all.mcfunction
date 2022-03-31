
#Get and Search machines with same Energy Storage from Stardust Fragment
	scoreboard players operation #temp stardust.data = @s energy.max_storage
	tag @s add stardust.balance
	tag @s add stardust.balanced
	scoreboard players set #success stardust.data 0
	execute store result score #success stardust.data align xyz positioned ~ ~1 ~ as @e[type=glow_item_frame,tag=!stardust.balance,tag=!stardust.balanced,tag=stardust.balancing,dx=0,dy=0,dz=0] if score @s energy.max_storage = #temp stardust.data
	execute if score #success stardust.data matches 0 store result score #success stardust.data align xyz positioned ~ ~-1 ~ as @e[type=glow_item_frame,tag=!stardust.balance,tag=!stardust.balanced,tag=stardust.balancing,dx=0,dy=0,dz=0] if score @s energy.max_storage = #temp stardust.data
	execute if score #success stardust.data matches 0 store result score #success stardust.data align xyz positioned ~ ~ ~1 as @e[type=glow_item_frame,tag=!stardust.balance,tag=!stardust.balanced,tag=stardust.balancing,dx=0,dy=0,dz=0] if score @s energy.max_storage = #temp stardust.data
	execute if score #success stardust.data matches 0 store result score #success stardust.data align xyz positioned ~ ~ ~-1 as @e[type=glow_item_frame,tag=!stardust.balance,tag=!stardust.balanced,tag=stardust.balancing,dx=0,dy=0,dz=0] if score @s energy.max_storage = #temp stardust.data
	execute if score #success stardust.data matches 0 store result score #success stardust.data align xyz positioned ~1 ~ ~ as @e[type=glow_item_frame,tag=!stardust.balance,tag=!stardust.balanced,tag=stardust.balancing,dx=0,dy=0,dz=0] if score @s energy.max_storage = #temp stardust.data
	execute if score #success stardust.data matches 0 store result score #success stardust.data align xyz positioned ~-1 ~ ~ as @e[type=glow_item_frame,tag=!stardust.balance,tag=!stardust.balanced,tag=stardust.balancing,dx=0,dy=0,dz=0] if score @s energy.max_storage = #temp stardust.data
	execute if score #success stardust.data matches 1 run function stardust:balance/balance

tag @e[type=glow_item_frame,tag=stardust.balance] remove stardust.balance
