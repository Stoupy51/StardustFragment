
setblock ~ ~ ~ barrel[facing=down]{CustomName:'[{"text":"Creative Quarry (50 block/s)"}]'}
data modify block ~ ~ ~ Lock set value ""
function stardust:place/glow_item_frame_0
execute as @e[type=glow_item_frame,tag=stardust.set_new] at @s run function stardust:place/quarry/lv6/secondary
