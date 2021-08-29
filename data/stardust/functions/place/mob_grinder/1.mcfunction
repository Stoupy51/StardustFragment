#Look at where the block has been placed
    function stardust:place/look_all
tag @s add SF_Placer
#Place the custom block
    execute as @e[type=minecraft:area_effect_cloud,tag=SF_Placed,limit=1] at @s run function stardust:place/mob_grinder/2
#Update scores
    execute as @e[type=minecraft:glow_item_frame,tag=SF_SetNew,limit=1] at @s run function stardust:place/mob_grinder/3
advancement revoke @s only stardust:place/mob_grinder
tag @s remove SF_Placer
