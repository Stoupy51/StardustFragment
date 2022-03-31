
setblock ~ ~ ~ diamond_block
summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["global.ignore","global.ignore.kill","smithed.block","stardust.destroyer","stardust.stardust_battery","stardust.balancing","energy.receive","energy.send","stardust.set_new"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"barrel",Count:1b,tag:{CustomModelData:2013253}}}
execute as @e[type=glow_item_frame,tag=stardust.set_new,limit=1] at @s run function stardust:place/stardust_battery/secondary
