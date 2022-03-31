
#Look at where the block has been placed
	function simplenergy:place/look_all_head
#Place the custom block
	execute as @e[type=area_effect_cloud,tag=simplenergy.placed,limit=1] at @s run function stardust:place/seeds/dark/primary
#Revoke advancement
	advancement revoke @s only stardust:place/seeds/dark
