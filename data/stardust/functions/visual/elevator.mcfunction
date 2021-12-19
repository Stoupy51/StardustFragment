execute if score @s energy.storage matches 20.. positioned ~ ~1 ~ as @a[distance=..1,dx=0,dz=0] unless score @s SF_X matches ..-1 run function stardust:work/elevator/all
scoreboard players remove @s[scores={energy.storage=20..}] energy.storage 1
#Update block
	data modify entity @s Item.tag.CustomModelData set value 2013233
	execute if score @s energy.storage matches 20.. run data modify entity @s Item.tag.CustomModelData set value 2013234
