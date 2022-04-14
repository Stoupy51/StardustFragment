
data modify entity @s Item.tag.CustomModelData set value 2013239
execute if score @s energy.storage < @s energy.max_storage run function stardust:work/heat_generator
