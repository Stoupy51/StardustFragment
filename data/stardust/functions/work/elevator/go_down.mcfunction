execute at @e[type=glow_item_frame,tag=stardust.elevator,distance=..1,dx=0,dz=0,limit=1] store result score temp stardust.data run tp @s ~ ~1.1 ~
execute if score temp stardust.data matches 1 run playsound stardust:elevator block @a[distance=..20]
execute if entity @s[distance=..256] if score temp stardust.data matches 0 positioned ~ ~-1 ~ run function stardust:work/elevator/go_down
execute if score temp stardust.data matches 1 run scoreboard players set @s stardust.data_2 -3
