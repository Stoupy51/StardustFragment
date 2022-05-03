
setblock ~ ~ ~ barrel[facing=down]{CustomName:'[{"text":"Quarry Lv.5 (5 block/s)"}]'}
data modify block ~ ~ ~ Lock set value ""
summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["global.ignore","global.ignore.kill","smithed.block","stardust.destroyer","stardust.destroy_barrel","stardust.quarry","stardust.quarry_lv5","stardust.tick_2_glows","energy.receive","stardust.set_new","stardust.force_load","global.forceload"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013304}}}
execute as @e[type=glow_item_frame,tag=stardust.set_new,limit=1] at @s run function stardust:place/quarry/lv5/secondary
