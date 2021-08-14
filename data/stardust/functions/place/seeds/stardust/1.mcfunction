#Look at where the block has been placed
    function stardust:place/look_all_head
#Place the custom block
    execute as @e[type=minecraft:area_effect_cloud,tag=SF_Placed,limit=1] at @s run function stardust:place/seeds/stardust/2
advancement revoke @s only stardust:place/seeds/stardust
