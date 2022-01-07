tag @s add StardustFragment_Balance
tag @s add StardustFragment_Balanced
execute as @e[type=glow_item_frame,tag=!StardustFragment_Balance,tag=StardustFragment_Destroyer,distance=..1.1] if score @s energy.max_storage = Temp StardustFragment_Data at @s run function stardust:balance/found
