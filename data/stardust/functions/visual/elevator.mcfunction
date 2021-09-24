execute if score @s EF_kJ matches 40.. positioned ~ ~1 ~ as @a[distance=..1,dx=0,dz=0] unless score @s SF_X matches ..-1 run function stardust:work/elevator/all
scoreboard players remove @s[scores={EF_kJ=40..}] EF_kJ 2
#Update block
	data modify entity @s Item.tag.CustomModelData set value 2013233
	execute if score @s EF_kJ matches 40.. run data modify entity @s Item.tag.CustomModelData set value 2013234
