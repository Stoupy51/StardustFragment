
setblock ~ ~ ~ daylight_detector
summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["global.ignore","global.ignore.kill","smithed.block","stardust.destroyer","stardust.destroy_daylight_detector","stardust.solarium_solar_panel","stardust.solar_panel","simplenergy.balancing","energy.send","stardust.set_new"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"deepslate",Count:1b,tag:{CustomModelData:2013334}}}
execute as @e[type=glow_item_frame,tag=stardust.set_new,limit=1] at @s run function stardust:place/solarium_solar_panel/secondary
