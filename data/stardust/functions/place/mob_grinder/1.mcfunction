#Look at where the block has been placed
	function stardust:place/look_all
tag @s add StardustFragment_Placer
#Place the custom block
	execute as @e[type=area_effect_cloud,tag=StardustFragment_Placed,limit=1] at @s run function stardust:place/mob_grinder/2
#Update scores
	execute as @e[type=glow_item_frame,tag=StardustFragment_SetNew,limit=1] at @s run function stardust:place/mob_grinder/3
advancement revoke @s only stardust:place/mob_grinder
tag @s remove StardustFragment_Placer
