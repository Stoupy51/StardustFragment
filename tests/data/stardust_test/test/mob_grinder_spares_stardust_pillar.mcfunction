# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

loot replace entity @s weapon.mainhand loot stardust:i/mob_grinder
item modify entity @s weapon.mainhand {type:"minecraft:set_count",count:2}
dummy @s use block ~2 ~-1 ~0
execute positioned ~2.5 ~.5 ~.5 run await entity @e[type=item_display,tag=stardust.mob_grinder,distance=..0.5]
execute positioned ~2.5 ~.5 ~.5 run data modify entity @n[type=item_display,tag=stardust.mob_grinder,distance=..0.5] Rotation[0] set value 0.0f
summon minecraft:zombie ~2.5 ~ ~3.5 {NoAI:1b,PersistenceRequired:1b,Tags:["stardust_test.victim","stardust.stardust_pillar"]}
execute positioned ~2.5 ~.5 ~.5 run scoreboard players set @n[type=item_display,tag=stardust.mob_grinder,distance=..0.5] energy.storage 1000
execute positioned ~2.5 ~.5 ~.5 as @n[type=item_display,tag=stardust.mob_grinder,distance=..0.5] at @s run function stardust:custom_blocks/mob_grinder/second
execute positioned ~2.5 ~.5 ~3.5 run assert entity @e[type=zombie,tag=stardust_test.victim,distance=..1]
