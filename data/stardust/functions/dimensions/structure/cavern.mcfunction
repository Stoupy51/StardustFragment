
summon glow_item_frame ~ ~-1 ~ {ItemRotation:0b,Tags:["global.ignore","global.ignore.kill","smithed.block","stardust.destroyer","stardust.destroy_cobbled_deepslate","stardust.portal","stardust.cavern_portal","stardust.infinite_energy"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013219}}}
fill ~-3 ~-3 ~-3 ~3 ~4 ~3 minecraft:cobblestone
fill ~-2 ~-2 ~-2 ~2 ~3 ~2 minecraft:air
fill ~-1 ~-2 ~-1 ~1 ~-2 ~1 minecraft:cobblestone
fill ~-2 ~-2 ~-2 ~2 ~-2 ~2 minecraft:torch replace minecraft:air
fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:torch replace minecraft:air
setblock ~ ~-1 ~ minecraft:cobbled_deepslate
