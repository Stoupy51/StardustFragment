# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

loot replace entity @s weapon.mainhand loot stardust:i/growth_accelerator
item modify entity @s weapon.mainhand {type:"minecraft:set_count",count:2}
dummy @s use block ~2 ~-1 ~2
execute positioned ~2.5 ~.5 ~2.5 run await entity @e[type=item_display,tag=stardust.growth_accelerator,distance=..0.5]
setblock ~0 ~ ~0 minecraft:farmland
setblock ~0 ~1 ~0 minecraft:wheat[age=0]
execute positioned ~2.5 ~.5 ~2.5 run scoreboard players set @n[type=item_display,tag=stardust.growth_accelerator,distance=..0.5] stardust.data 55
execute positioned ~2.5 ~.5 ~2.5 run scoreboard players set @n[type=item_display,tag=stardust.growth_accelerator,distance=..0.5] energy.storage 12000
execute positioned ~2.5 ~.5 ~2.5 as @n[type=item_display,tag=stardust.growth_accelerator,distance=..0.5] at @s run function stardust:custom_blocks/growth_accelerator/second_5
assert block ~0 ~1 ~0 minecraft:wheat[age=1]
execute positioned ~2.5 ~.5 ~2.5 run assert entity @e[type=item_display,tag=stardust.growth_accelerator,distance=..0.5,scores={energy.storage=11500}]
