
setblock ~ ~ ~ diamond_block
summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["global.ignore","global.ignore.kill","smithed.block","stardust.destroyer","stardust.destroy_diamond_block","stardust.growth_accelerator","energy.receive","stardust.set_new"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"deepslate",Count:1b,tag:{CustomModelData:2013339}}}
execute as @e[type=glow_item_frame,tag=stardust.set_new,limit=1] at @s run function stardust:place/growth_accelerator/secondary
