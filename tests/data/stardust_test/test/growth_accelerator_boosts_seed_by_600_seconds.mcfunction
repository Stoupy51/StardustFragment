# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

loot replace entity @s weapon.mainhand loot stardust:i/growth_accelerator
item modify entity @s weapon.mainhand {type:"minecraft:set_count",count:2}
dummy @s use block ~2 ~-1 ~2
execute positioned ~2.5 ~.5 ~2.5 run await entity @e[type=item_display,tag=stardust.growth_accelerator,distance=..0.5]
setblock ~0 ~ ~0 minecraft:stone
loot replace entity @s weapon.mainhand loot stardust:i/diamond_seed
item modify entity @s weapon.mainhand {type:"minecraft:set_count",count:2}
dummy @s use block ~0 ~ ~0 up
execute positioned ~.5 ~1.5 ~.5 run await entity @e[type=item_display,tag=stardust.diamond_seed,distance=..0.5]
execute positioned ~.5 ~1.5 ~.5 run scoreboard players set @n[type=item_display,tag=stardust.diamond_seed,distance=..0.5] stardust.growth_time 0
execute positioned ~2.5 ~.5 ~2.5 run scoreboard players set @n[type=item_display,tag=stardust.growth_accelerator,distance=..0.5] stardust.data 55
execute positioned ~2.5 ~.5 ~2.5 run scoreboard players set @n[type=item_display,tag=stardust.growth_accelerator,distance=..0.5] energy.storage 12000
execute positioned ~2.5 ~.5 ~2.5 as @n[type=item_display,tag=stardust.growth_accelerator,distance=..0.5] at @s run function stardust:custom_blocks/growth_accelerator/second_5
execute positioned ~.5 ~1.5 ~.5 run assert entity @e[type=item_display,tag=stardust.diamond_seed,distance=..0.5,scores={stardust.growth_time=660}]
