execute at @e[type=glow_item_frame,tag=SF_Elevator,distance=..1,dx=0,dz=0,limit=1] store result score Temp SF_Data run tp @s ~ ~1.1 ~
execute if score Temp SF_Data matches 1 run playsound stardust:elevator block @a[distance=..20]
execute as @s[distance=..256] if score Temp SF_Data matches 0 positioned ~ ~-1 ~ run function stardust:work/elevator/go_down
execute if score Temp SF_Data matches 1 run scoreboard players set @s SF_X -3
