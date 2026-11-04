# @template stardust_test:room_large
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 600
await score #stardust.loaded load.status matches 1

place template stardust:awakened_forge ~2 ~ ~2
execute positioned ~4.5 ~2 ~4.5 run function stardust_test:forge/drop_stardust_sniper_ingredients {dragon_pearls:3}
# Summoned items stay frozen until their chunk ticks entities, and the forge ignores them until then
execute positioned ~4.5 ~2 ~4.5 run await entity @e[type=item,distance=..0.5,nbt={OnGround:1b}]

await delay 120
execute positioned ~4.5 ~2 ~4.5 run assert entity @e[type=item,distance=..1,nbt={Item:{components:{"minecraft:custom_data":{stardust:{compacted_stardust_shard:true}}}}}]
execute positioned ~4.5 ~2 ~4.5 run assert entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:netherite_spear"}}]
