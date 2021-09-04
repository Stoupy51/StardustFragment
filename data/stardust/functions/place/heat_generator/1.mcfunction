#Look at where the block has been placed
    function stardust:place/look_all
tag @s add SF_Placer
#Place the custom block
    execute as @e[type=area_effect_cloud,tag=SF_Placed,limit=1] at @s run function stardust:place/heat_generator/2
#Update scores
    execute as @e[type=glow_item_frame,tag=SF_SetNew,limit=1] at @s run function stardust:place/heat_generator/3
advancement revoke @s only stardust:place/heat_generator
tag @s remove SF_Placer
