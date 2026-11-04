# Drops a stack of a Stardust item, motionless and out of the dummy's reach, at the current position
$loot replace entity @s hotbar.8 loot stardust:i/$(id)
$item modify entity @s hotbar.8 {type:"minecraft:set_count",count:$(count)}
summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:stone"},PickupDelay:32767s,Tags:["stardust_test.dropped"]}
item replace entity @n[type=item,tag=stardust_test.dropped,distance=..0.1] contents from entity @s hotbar.8
tag @e[type=item,tag=stardust_test.dropped,distance=..0.1] remove stardust_test.dropped
