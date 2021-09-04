#Look at where the block has been placed
    function stardust:place/look_all
#Place the custom block
    execute as @e[type=area_effect_cloud,tag=SF_Placed,limit=1] at @s run function stardust:place/cobblestone_miner/lv1/2
advancement revoke @s only stardust:place/cobblestone_miner/lv1
