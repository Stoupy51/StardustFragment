#Replace the item to keep Motion
    kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:wheat"}},limit=1,sort=nearest,distance=..1]
    kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:wheat"}},limit=1,sort=nearest,distance=..1]
    summon item ~ ~ ~ {Item:{id:"minecraft:cobblestone",Count:64b,tag:{SF_Give:1b}}}
    data modify entity @e[type=minecraft:item,nbt={Item:{tag:{SF_Give:1b}}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013008
