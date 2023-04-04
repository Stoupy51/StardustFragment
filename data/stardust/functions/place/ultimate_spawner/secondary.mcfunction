
function stardust:place/block_tags
item replace entity @s container.0 with deepslate{CustomModelData:2013215}
tag @s add stardust.ultimate_spawner
tag @s add stardust.destroy_spawner

# Item display brightness
data remove entity @s brightness

