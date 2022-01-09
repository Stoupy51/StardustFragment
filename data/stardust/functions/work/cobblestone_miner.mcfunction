setblock ~ ~ ~ minecraft:air destroy
execute if entity @s[tag=StardustFragment_CobblestoneMinerLv1] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:cobblestone"}},sort=nearest,limit=1] Item set from storage stardust:items all.2013016
execute if entity @s[tag=StardustFragment_CobblestoneMinerLv2] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:cobblestone"}},sort=nearest,limit=1] Item set from storage stardust:items all.2013016
execute if entity @s[tag=StardustFragment_CobblestoneMinerLv2] run data modify entity @e[type=item,nbt={Item:{tag:{ctc:{id:"double_compressed_cobblestone"}}}},sort=nearest,limit=1] Item.Count set value 3b
execute if entity @s[tag=StardustFragment_CobblestoneMinerLv3] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:cobblestone"}},sort=nearest,limit=1] Item set from storage stardust:items all.2013017
execute if entity @s[tag=StardustFragment_CobblestoneMinerLv4] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:cobblestone"}},sort=nearest,limit=1] Item set from storage stardust:items all.2013017
execute if entity @s[tag=StardustFragment_CobblestoneMinerLv4] run data modify entity @e[type=item,nbt={Item:{tag:{ctc:{id:"triple_compressed_cobblestone"}}}},sort=nearest,limit=1] Item.Count set value 3b
execute if entity @s[tag=StardustFragment_CobblestoneMinerLv5] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:cobblestone"}},sort=nearest,limit=1] Item set from storage stardust:items all.2013018
