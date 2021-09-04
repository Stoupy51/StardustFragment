#Replace the item to keep Motion
    data modify entity @e[type=item,nbt={Item:{id:"minecraft:cobblestone"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013016
kill @s
