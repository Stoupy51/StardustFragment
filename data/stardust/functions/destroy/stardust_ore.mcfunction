#Replace the item to keep Motion
    data modify entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:deepslate_diamond_ore"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013023
    execute store result storage stardust:items Count byte 1 run data get entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:diamond"}},limit=1,sort=nearest,distance=..1] Item.Count
    data modify entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:diamond"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013000
    data modify entity @e[type=minecraft:item,nbt={Item:{tag:{SF_StardustFragment:1b}}},limit=1,sort=nearest,distance=..1] Item.Count set from storage stardust:items Count
kill @s