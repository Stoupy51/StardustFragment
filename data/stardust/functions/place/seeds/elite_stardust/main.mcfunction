
#Place the custom block
	execute as @e[tag=stardust.set_new,tag=stardust.seed] at @s run function stardust:place/seeds/elite_stardust/primary
	execute as @e[tag=stardust.destroyer] at @s run function stardust:destroy/all
#Advancement
	advancement grant @s only stardust:visible/adventure/seeds/elite_stardust
	advancement revoke @s only stardust:place/seeds/elite_stardust
