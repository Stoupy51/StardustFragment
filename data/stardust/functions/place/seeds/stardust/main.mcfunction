
#Place the custom block
	execute as @e[type=item_frame,tag=stardust.set_new,tag=stardust.seed] at @s run function stardust:place/seeds/stardust/primary
#Revoke advancement
	advancement revoke @s only stardust:place/seeds/stardust
