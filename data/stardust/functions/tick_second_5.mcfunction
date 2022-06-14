
#Others
	scoreboard players set #second_5 stardust.data 0
	scoreboard players add #minute stardust.data 1
	execute if score #minute stardust.data matches 12.. run function stardust:tick_minute
	execute as @e[tag=stardust.destroyer] at @s run function stardust:destroy/all

#Mobs
	execute at @e[type=bat,tag=stardust.stardust_bat] at @a[distance=5..12,tag=!stardust.no_bolt,gamemode=!spectator,gamemode=!creative] run summon lightning_bolt

