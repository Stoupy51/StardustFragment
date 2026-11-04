# @template stardust_test:room_large
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 600
await score #stardust.loaded load.status matches 1

# The forge only runs for an item with custom_data, and this recipe checks a vanilla redstone block as that item, so it never crafts
place template stardust:awakened_forge ~2 ~ ~2
execute positioned ~4.5 ~2 ~4.5 run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:redstone_block",count:64},PickupDelay:32767s}
execute positioned ~4.5 ~2 ~4.5 run function stardust_test:forge/drop {id:"awakened_stardust_frame",count:8}
execute positioned ~4.5 ~2 ~4.5 run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:red_glazed_terracotta",count:64},PickupDelay:32767s}
execute positioned ~4.5 ~2 ~4.5 run function stardust_test:forge/drop {id:"ender_dragon_pearl",count:8}
execute positioned ~4.5 ~2 ~4.5 run function stardust_test:forge/drop {id:"stardust_bow",count:1}
execute positioned ~4.5 ~2 ~4.5 run function stardust_test:forge/drop {id:"sextuple_compressed_cobblestone",count:8}
execute positioned ~4.5 ~2 ~4.5 run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:red_nether_bricks",count:64},PickupDelay:32767s}
execute positioned ~4.5 ~2 ~4.5 run function stardust_test:forge/drop {id:"awakened_stardust_block",count:8}
execute positioned ~4.5 ~2 ~4.5 run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:red_mushroom_block",count:64},PickupDelay:32767s}
# Summoned items stay frozen until their chunk ticks entities, and the forge ignores them until then
execute positioned ~4.5 ~2 ~4.5 run await entity @e[type=item,distance=..0.5,nbt={OnGround:1b}]

execute positioned ~4.5 ~2 ~4.5 run await entity @e[type=item,distance=..16,nbt={Item:{components:{"minecraft:custom_data":{stardust:{awakened_stardust_bow:true}}}}}]
