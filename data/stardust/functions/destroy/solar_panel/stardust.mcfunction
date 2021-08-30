#Replace the item to keep Motion
    data modify entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:daylight_detector"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013248
kill @s
execute as @e[type=minecraft:glow_item_frame,tag=EF_Wire,distance=..2] at @s run function energy_flux:wire_update
