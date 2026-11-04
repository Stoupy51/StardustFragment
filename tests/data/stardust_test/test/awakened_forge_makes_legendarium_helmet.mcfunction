# @template stardust_test:room_large
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 600
await score #stardust.loaded load.status matches 1

place template stardust:awakened_forge ~2 ~ ~2
execute positioned ~4.5 ~2 ~4.5 run function stardust_test:forge/drop {id:"original_stardust_helmet",count:1}
execute positioned ~4.5 ~2 ~4.5 run function stardust_test:forge/drop {id:"legendarium_block",count:4}
execute positioned ~4.5 ~2 ~4.5 run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:wind_charge",count:64},PickupDelay:32767s}
execute positioned ~4.5 ~2 ~4.5 run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:feather",count:64},PickupDelay:32767s}
execute positioned ~4.5 ~2 ~4.5 run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:feather",count:32},PickupDelay:32767s}
execute positioned ~4.5 ~2 ~4.5 run function stardust_test:forge/drop {id:"ender_dragon_pearl",count:6}
execute positioned ~4.5 ~2 ~4.5 run function stardust_test:forge/drop {id:"awakened_stardust_block",count:8}
execute positioned ~4.5 ~2 ~4.5 run function stardust_test:forge/drop {id:"legendarium_ingot",count:12}
execute positioned ~4.5 ~2 ~4.5 run function stardust_test:forge/drop {id:"sextuple_compressed_cobblestone",count:1}
# Summoned items stay frozen until their chunk ticks entities, and the forge ignores them until then
execute positioned ~4.5 ~2 ~4.5 run await entity @e[type=item,distance=..0.5,nbt={OnGround:1b}]

execute positioned ~4.5 ~2 ~4.5 run await entity @e[type=item,distance=..16,nbt={Item:{components:{"minecraft:custom_data":{stardust:{legendarium_helmet:true}}}}}]
