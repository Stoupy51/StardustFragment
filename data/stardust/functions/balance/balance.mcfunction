
#Collect power
	scoreboard players set #count stardust.data 1
	scoreboard players operation #amount stardust.data = @s energy.storage
	execute align xyz positioned ~ ~1 ~ as @e[type=glow_item_frame,tag=!stardust.balance,tag=!stardust.balanced,tag=stardust.balancing,dx=0,dy=0,dz=0] if score @s energy.max_storage = #temp stardust.data at @s run function stardust:balance/found
	execute align xyz positioned ~ ~-1 ~ as @e[type=glow_item_frame,tag=!stardust.balance,tag=!stardust.balanced,tag=stardust.balancing,dx=0,dy=0,dz=0] if score @s energy.max_storage = #temp stardust.data at @s run function stardust:balance/found
	execute align xyz positioned ~ ~ ~1 as @e[type=glow_item_frame,tag=!stardust.balance,tag=!stardust.balanced,tag=stardust.balancing,dx=0,dy=0,dz=0] if score @s energy.max_storage = #temp stardust.data at @s run function stardust:balance/found
	execute align xyz positioned ~ ~ ~-1 as @e[type=glow_item_frame,tag=!stardust.balance,tag=!stardust.balanced,tag=stardust.balancing,dx=0,dy=0,dz=0] if score @s energy.max_storage = #temp stardust.data at @s run function stardust:balance/found
	execute align xyz positioned ~1 ~ ~ as @e[type=glow_item_frame,tag=!stardust.balance,tag=!stardust.balanced,tag=stardust.balancing,dx=0,dy=0,dz=0] if score @s energy.max_storage = #temp stardust.data at @s run function stardust:balance/found
	execute align xyz positioned ~-1 ~ ~ as @e[type=glow_item_frame,tag=!stardust.balance,tag=!stardust.balanced,tag=stardust.balancing,dx=0,dy=0,dz=0] if score @s energy.max_storage = #temp stardust.data at @s run function stardust:balance/found

#Redistributes Energy
	scoreboard players operation #balance stardust.data = #amount stardust.data
	scoreboard players operation #balance stardust.data /= #count stardust.data
	scoreboard players operation #amount stardust.data %= #count stardust.data
	scoreboard players operation @e[type=glow_item_frame,tag=stardust.balance] energy.storage = #balance stardust.data
	scoreboard players operation @s energy.storage += #amount stardust.data
	execute if score @s energy.storage > @s energy.max_storage run scoreboard players operation @s energy.storage = @s energy.max_storage
