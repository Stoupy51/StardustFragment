#Look at where the block has been placed
    function stardust:place/look_all
#Place the custom block
    execute as @e[type=minecraft:area_effect_cloud,tag=SF_Placed,limit=1] at @s run function stardust:place/celestial_portal/2
#Update scores
    execute as @e[type=minecraft:glow_item_frame,tag=SF_SetNew,limit=1] at @s run function stardust:place/celestial_portal/3
advancement revoke @s only stardust:place/celestial_portal