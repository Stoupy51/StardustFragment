
#Replace the item to keep Motion
	execute if entity @s[tag=stardust.cobblestone_miner_lv1] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:cobbled_deepslate"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:main all.2013208
	execute if entity @s[tag=stardust.cobblestone_miner_lv2] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:cobbled_deepslate"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:main all.2013209
	execute if entity @s[tag=stardust.cobblestone_miner_lv3] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:cobbled_deepslate"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:main all.2013210
	execute if entity @s[tag=stardust.cobblestone_miner_lv4] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:cobbled_deepslate"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:main all.2013211
	execute if entity @s[tag=stardust.cobblestone_miner_lv5] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:cobbled_deepslate"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:main all.2013212
kill @s
