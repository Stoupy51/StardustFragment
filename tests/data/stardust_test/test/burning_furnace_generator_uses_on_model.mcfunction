# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

loot replace entity @s weapon.mainhand loot stardust:i/awakened_stardust_furnace_generator
item modify entity @s weapon.mainhand {type:"minecraft:set_count",count:2}
dummy @s use block ~2 ~-1 ~2
execute positioned ~2.5 ~.5 ~2.5 run await entity @e[type=item_display,tag=stardust.awakened_stardust_furnace_generator,distance=..0.5]

data modify block ~2 ~ ~2 lit_time_remaining set value 100s
execute positioned ~2.5 ~.5 ~2.5 as @e[type=item_display,tag=stardust.awakened_stardust_furnace_generator,distance=..0.5] run scoreboard players set @s energy.storage 0
execute positioned ~2.5 ~.5 ~2.5 as @e[type=item_display,tag=stardust.awakened_stardust_furnace_generator,distance=..0.5] at @s run function stardust:custom_blocks/awakened_stardust_furnace_generator/second
execute positioned ~2.5 ~.5 ~2.5 run assert entity @e[type=item_display,tag=stardust.awakened_stardust_furnace_generator,distance=..0.5,nbt={item:{components:{"minecraft:item_model":"stardust:awakened_stardust_furnace_generator_on"}}}]
