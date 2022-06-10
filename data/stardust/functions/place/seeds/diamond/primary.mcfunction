
setblock ~ ~ ~ moss_carpet
function stardust:place/block_tags
data modify entity @s Item set value {id:"cobblestone",Count:1b,tag:{CustomModelData:2013200}}
playsound item.crop.plant block @a[distance=..50]
tag @s add stardust.diamond_seed
tag @s add stardust.diamond_seeds
