#Look at where the block has been placed
    function stardust:place/look_all
#Place the custom block
    execute as @e[type=minecraft:area_effect_cloud,tag=SE_Placed,limit=1] at @s run function stardust:place/awakened_stardust_block/2
advancement revoke @s only stardust:place/awakened_stardust_block
