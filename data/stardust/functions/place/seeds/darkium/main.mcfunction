
#Place the custom block
	execute as @e[tag=stardust.set_new,tag=stardust.seed] at @s run function stardust:place/seeds/darkium/primary
#Advancement
	advancement grant @s only stardust:visible/adventure/seeds/darkium
	advancement revoke @s only stardust:place/seeds/darkium
