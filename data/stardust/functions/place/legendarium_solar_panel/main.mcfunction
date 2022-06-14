
setblock ~ ~ ~ daylight_detector
function stardust:place/glow_item_frame_0
execute as @e[tag=stardust.set_new] at @s run function stardust:place/legendarium_solar_panel/secondary
