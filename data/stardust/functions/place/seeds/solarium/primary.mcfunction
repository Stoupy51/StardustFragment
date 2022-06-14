
setblock ~ ~ ~ moss_carpet
function stardust:place/block_tags
item replace entity @s container.0 with cobblestone{CustomModelData:2013206}}
playsound item.crop.plant block @a[distance=..50]
tag @s add stardust.solarium_seed
tag @s add stardust.elementary_seeds
