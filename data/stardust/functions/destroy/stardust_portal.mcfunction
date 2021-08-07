#Replace the item to keep Motion
    data modify entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:lapis_block"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013221
kill @s
