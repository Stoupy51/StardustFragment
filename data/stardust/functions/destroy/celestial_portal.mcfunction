#Replace the item to keep Motion
    data modify entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:iron_block"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013220
kill @s
