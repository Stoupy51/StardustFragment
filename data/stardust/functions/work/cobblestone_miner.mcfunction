setblock ~ ~ ~ air destroy
execute if entity @s[tag=stardust.cobblestone_miner_lv1] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:cobblestone"}},sort=nearest,limit=1] Item set from storage stardust:main all.2013016
execute if entity @s[tag=stardust.cobblestone_miner_lv2] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:cobblestone"}},sort=nearest,limit=1] Item set from storage stardust:main all.2013016
execute if entity @s[tag=stardust.cobblestone_miner_lv2] run data modify entity @e[type=item,nbt={Item:{tag:{ctc:{id:"double_compressed_cobblestone"}}}},sort=nearest,limit=1] Item.Count set value 3b
execute if entity @s[tag=stardust.cobblestone_miner_lv3] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:cobblestone"}},sort=nearest,limit=1] Item set from storage stardust:main all.2013017
execute if entity @s[tag=stardust.cobblestone_miner_lv4] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:cobblestone"}},sort=nearest,limit=1] Item set from storage stardust:main all.2013017
execute if entity @s[tag=stardust.cobblestone_miner_lv4] run data modify entity @e[type=item,nbt={Item:{tag:{ctc:{id:"triple_compressed_cobblestone"}}}},sort=nearest,limit=1] Item.Count set value 3b
execute if entity @s[tag=stardust.cobblestone_miner_lv5] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:cobblestone"}},sort=nearest,limit=1] Item set from storage stardust:main all.2013018
