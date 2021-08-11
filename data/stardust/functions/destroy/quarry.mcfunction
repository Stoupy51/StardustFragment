#Replace the item to keep Motion
    execute if entity @s[tag=SF_QuarryLv1] run data modify entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:barrel"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013213
    execute if entity @s[tag=SF_QuarryLv2] run data modify entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:barrel"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013214
    execute if entity @s[tag=SF_QuarryLv3] run data modify entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:barrel"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013215
    execute if entity @s[tag=SF_QuarryLv4] run data modify entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:barrel"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013216
    execute if entity @s[tag=SF_QuarryLv5] run data modify entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:barrel"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013217
    execute if entity @s[tag=SF_QuarryLv6] run data modify entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:barrel"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:items 2013218
#Update the Quarry to keep Energy
    execute if score @s EF_Joule matches 1.. run function stardust:destroy/keep_energy

kill @s
execute as @e[type=minecraft:glow_item_frame,tag=EF_Wire,distance=..2] at @s run function energy_flux:wire_update
