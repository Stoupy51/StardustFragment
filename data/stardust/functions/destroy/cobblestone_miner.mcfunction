#Replace the item to keep Motion
	execute as @s[tag=StardustFragment_CobblestoneMinerLv1] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:cobbled_deepslate"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items all.2013208
	execute as @s[tag=StardustFragment_CobblestoneMinerLv2] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:cobbled_deepslate"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items all.2013209
	execute as @s[tag=StardustFragment_CobblestoneMinerLv3] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:cobbled_deepslate"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items all.2013210
	execute as @s[tag=StardustFragment_CobblestoneMinerLv4] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:cobbled_deepslate"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items all.2013211
	execute as @s[tag=StardustFragment_CobblestoneMinerLv5] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:cobbled_deepslate"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] Item set from storage stardust:items all.2013212
kill @s
