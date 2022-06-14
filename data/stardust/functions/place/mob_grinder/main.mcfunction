
setblock ~ ~ ~ cobbled_deepslate
function stardust:place/glow_item_frame_rotation
execute as @e[tag=stardust.set_new] at @s run function stardust:place/mob_grinder/secondary
