
data modify entity @s item.tag.CustomModelData set value 2013322
execute if score @s energy.storage < @s energy.max_storage run function stardust:work/heat_generator
