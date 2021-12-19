tag @s add SF_Balance
tag @s add SF_Balanced
execute as @e[type=glow_item_frame,tag=!SF_Balance,tag=SF_Destroyer,distance=..1.1] if score @s energy.max_storage = Temp SF_Data at @s run function stardust:balance/found
