
#Place the custom block
	execute as @e[tag=stardust.set_new,tag=stardust.seed] at @s run function stardust:place/seeds/advanced_stardust/primary
#Revoke advancement
	advancement revoke @s only stardust:place/seeds/advanced_stardust
