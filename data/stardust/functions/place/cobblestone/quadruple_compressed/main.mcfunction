
setblock ~ ~ ~ cobblestone
function stardust:place/glow_item_frame_0
execute as @e[type=glow_item_frame,tag=stardust.set_new] at @s run function stardust:place/cobblestone/quadruple_compressed/secondary
