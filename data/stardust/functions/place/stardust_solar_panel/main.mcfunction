
setblock ~ ~ ~ daylight_detector
function stardust:place/glow_item_frame_0
execute as @e[tag=stardust.set_new] at @s run function stardust:place/stardust_solar_panel/secondary
