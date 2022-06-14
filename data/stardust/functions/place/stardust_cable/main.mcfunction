
#Look at where the block has been placed
	execute anchored eyes facing ^ ^ ^2 run function simplenergy:place/look_all_head
#Place the custom block
	execute as @e[tag=simplenergy.placed] at @s run function stardust:place/stardust_cable/primary
#Revoke advancement
	advancement revoke @s only stardust:place/stardust_cable
