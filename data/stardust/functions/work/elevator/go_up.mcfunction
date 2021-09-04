execute at @e[type=glow_item_frame,tag=SF_Elevator,distance=..1,dx=0,dz=0,limit=1] store result score Found SF_Jump run tp @s ~ ~1.1 ~
execute if entity @s[distance=..42] if score Found SF_Jump matches 0 positioned ~ ~1 ~ run function stardust:work/elevator/go_up
scoreboard players set @s SF_X -6
