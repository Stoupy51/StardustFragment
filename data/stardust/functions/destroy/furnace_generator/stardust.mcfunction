#Replace the item to keep Motion
    data modify entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:furnace"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013244
kill @e[type=minecraft:item,nbt={Item:{tag:{SE_CustomTextureItem:1b}}},distance=..1]
kill @s
execute as @e[type=minecraft:glow_item_frame,tag=EF_Wire,distance=..2] at @s run function energy_flux:wire_update