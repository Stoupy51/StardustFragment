
setblock ~ ~ ~ barrel[facing=down]{CustomName:'[{"text":"Quarry Lv.1 (1 block/s)"}]'}
data modify block ~ ~ ~ Lock set value ""
function stardust:place/glow_item_frame_0
execute as @e[tag=stardust.set_new] at @s run function stardust:place/quarry/lv1/secondary
