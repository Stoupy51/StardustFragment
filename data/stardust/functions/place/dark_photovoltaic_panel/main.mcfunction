
setblock ~ ~ ~ minecraft:daylight_detector
summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["global.ignore","global.ignore.kill","smithed.block","stardust.destroyer","stardust.destroy_daylight_detector","stardust.dark_photovoltaic_panel","stardust.photovoltaic_panel","stardust.balancing","energy.send","stardust.set_new"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"soul_campfire",Count:1b,tag:{CustomModelData:2013252}}}
execute as @e[type=glow_item_frame,tag=stardust.set_new,limit=1] at @s run function stardust:place/dark_photovoltaic_panel/secondary
