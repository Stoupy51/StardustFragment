
setblock ~ ~ ~ glass
function stardust:place/glow_item_frame_rotation
execute as @e[tag=stardust.set_new] at @s run function stardust:place/life_crystal/secondary

