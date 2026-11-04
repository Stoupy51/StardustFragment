# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

setblock ~2 ~ ~2 minecraft:crafter[orientation=east_up]
item replace block ~2 ~ ~2 container.0 with minecraft:diamond
item replace block ~2 ~ ~2 container.1 with minecraft:diamond
item replace block ~2 ~ ~2 container.3 with minecraft:quartz
item replace block ~2 ~ ~2 container.4 with minecraft:quartz
item replace block ~2 ~ ~2 container.6 with minecraft:quartz
item replace block ~2 ~ ~2 container.7 with minecraft:quartz
setblock ~2 ~1 ~2 minecraft:redstone_block

execute positioned ~3.5 ~.5 ~2.5 run await entity @e[type=item,distance=..2,nbt={Item:{components:{"minecraft:custom_data":{stardust:{quarry_configurator:true}}}}}]
