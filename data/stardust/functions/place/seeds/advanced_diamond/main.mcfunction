
#Place the custom block
	execute as @e[tag=stardust.set_new,tag=stardust.seed] at @s run function stardust:place/seeds/advanced_diamond/primary
#Advancement
	advancement grant @s only stardust:visible/adventure/seeds/advanced_diamond
	advancement revoke @s only stardust:place/seeds/advanced_diamond
