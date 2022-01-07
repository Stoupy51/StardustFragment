#Look at where the block has been placed
	function stardust:place/look_all
tag @s add StardustFragment_Placer
#Place the custom block
	execute as @e[type=area_effect_cloud,tag=StardustFragment_Placed,limit=1] at @s run function stardust:place/elevator/2
#Update scores
	execute as @e[type=glow_item_frame,tag=StardustFragment_SetNew,limit=1] at @s run function stardust:place/elevator/3
advancement revoke @s only stardust:place/elevator
tag @s remove StardustFragment_Placer
