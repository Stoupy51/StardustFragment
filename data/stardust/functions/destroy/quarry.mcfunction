
# Replace the item to keep Motion
execute if entity @s[tag=stardust.quarry_lv1] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:barrel"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:main all.2013300
execute if entity @s[tag=stardust.quarry_lv2] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:barrel"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:main all.2013301
execute if entity @s[tag=stardust.quarry_lv3] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:barrel"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:main all.2013302
execute if entity @s[tag=stardust.quarry_lv4] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:barrel"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:main all.2013303
execute if entity @s[tag=stardust.quarry_lv5] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:barrel"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:main all.2013304
execute if entity @s[tag=stardust.quarry_lv6] run data modify entity @e[type=item,nbt={Item:{id:"minecraft:barrel"}},limit=1,sort=nearest,distance=..1] Item set from storage stardust:main all.2013305

# Update the Quarry to keep Energy
scoreboard players operation #storage simplenergy.data = @s energy.storage
execute if score #storage simplenergy.data matches 1.. as @e[type=item,nbt={Item:{tag:{energy:{}}}},limit=1,sort=nearest,distance=..1] run function simplenergy:destroy/keep_energy

# Kill undesired items
kill @e[type=item,nbt={Item:{tag:{simplenergy:{texture_item:1b}}}},distance=..1]

# Call on a machine when broken to remove its connections
function energy:v1/api/break_machine
kill @s

