#Replace the item to keep Motion
    data modify entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:deepslate_redstone_ore"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013024
    execute store result storage stardust:items Count byte 1 run data get entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:redstone"}},limit=1,sort=nearest,distance=..1] Item.Count
    data modify entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:redstone"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013004
    data modify entity @e[type=minecraft:item,nbt={Item:{tag:{SF_AwakenedStardust:1b}}},limit=1,sort=nearest,distance=..1] Item.Count set from storage stardust:items Count
kill @s
