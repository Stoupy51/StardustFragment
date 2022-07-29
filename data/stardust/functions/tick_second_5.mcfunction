
#Others
	scoreboard players set #second_5 stardust.data -10
	scoreboard players add #minute stardust.data 1
	execute if score #minute stardust.data matches 13.. run function stardust:tick_minute
	execute as @e[tag=stardust.destroyer] at @s run function stardust:destroy/all

#Entities
	execute at @e[tag=stardust.stardust_bat] at @a[distance=5..12,tag=!stardust.no_bolt,gamemode=!spectator,gamemode=!creative] run summon lightning_bolt
	execute as @e[tag=stardust.hopper_minecart] at @s unless entity @e[tag=stardust.quarry,distance=..3] run function stardust:quarry/extract/hopper_minecart/release

