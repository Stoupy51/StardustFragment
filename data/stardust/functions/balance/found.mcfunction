
tag @s add stardust.balance
tag @s add stardust.balanced
scoreboard players add #count stardust.data 1
scoreboard players operation #amount stardust.data += @s energy.storage

#Find another adjacent block to balance to
	execute align xyz positioned ~ ~1 ~ as @e[type=glow_item_frame,tag=!stardust.balance,tag=!stardust.balanced,tag=stardust.balancing,dx=0,dy=0,dz=0] if score @s energy.max_storage = ##temp stardust.data at @s run function stardust:balance/found
	execute align xyz positioned ~ ~-1 ~ as @e[type=glow_item_frame,tag=!stardust.balance,tag=!stardust.balanced,tag=stardust.balancing,dx=0,dy=0,dz=0] if score @s energy.max_storage = ##temp stardust.data at @s run function stardust:balance/found
	execute align xyz positioned ~ ~ ~1 as @e[type=glow_item_frame,tag=!stardust.balance,tag=!stardust.balanced,tag=stardust.balancing,dx=0,dy=0,dz=0] if score @s energy.max_storage = ##temp stardust.data at @s run function stardust:balance/found
	execute align xyz positioned ~ ~ ~-1 as @e[type=glow_item_frame,tag=!stardust.balance,tag=!stardust.balanced,tag=stardust.balancing,dx=0,dy=0,dz=0] if score @s energy.max_storage = ##temp stardust.data at @s run function stardust:balance/found
	execute align xyz positioned ~1 ~ ~ as @e[type=glow_item_frame,tag=!stardust.balance,tag=!stardust.balanced,tag=stardust.balancing,dx=0,dy=0,dz=0] if score @s energy.max_storage = ##temp stardust.data at @s run function stardust:balance/found
	execute align xyz positioned ~-1 ~ ~ as @e[type=glow_item_frame,tag=!stardust.balance,tag=!stardust.balanced,tag=stardust.balancing,dx=0,dy=0,dz=0] if score @s energy.max_storage = ##temp stardust.data at @s run function stardust:balance/found
