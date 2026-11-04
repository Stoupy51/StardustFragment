# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

loot replace entity @s weapon.mainhand loot stardust:i/ultimate_frame
item modify entity @s weapon.mainhand {type:"minecraft:set_count",count:2}
dummy @s use block ~2 ~-1 ~2
execute positioned ~2.5 ~.5 ~2.5 run await entity @e[type=item_display,tag=stardust.ultimate_frame,distance=..0.5]
setblock ~2 ~ ~2 minecraft:air destroy
execute positioned ~2.5 ~.5 ~2.5 run await not entity @e[type=item_display,tag=stardust.ultimate_frame,distance=..0.5]
execute positioned ~2.5 ~.5 ~2.5 run await entity @e[type=item,distance=..1.5,nbt={Item:{components:{"minecraft:custom_data":{stardust:{ultimate_frame:true}}}}}]
