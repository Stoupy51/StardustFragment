function stardust:place/look_all_head
#Place the custom block
    execute as @e[type=minecraft:area_effect_cloud,tag=SF_Placed,limit=1] at @s run function stardust:place/awakened_stardust_wire/2
#Update scores
    execute as @e[type=minecraft:glow_item_frame,tag=SF_SetNew,limit=1] at @s run function stardust:place/awakened_stardust_wire/3
advancement revoke @s only stardust:place/awakened_stardust_wire