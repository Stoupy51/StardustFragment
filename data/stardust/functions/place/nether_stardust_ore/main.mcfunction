
setblock ~ ~ ~ nether_quartz_ore
function stardust:place/glow_item_frame_0
execute as @e[tag=stardust.set_new] at @s run function stardust:place/nether_stardust_ore/secondary
