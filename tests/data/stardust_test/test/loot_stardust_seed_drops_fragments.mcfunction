# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 200
await score #stardust.loaded load.status matches 1

loot spawn ~2 ~ ~2 loot stardust:seeds/stardust_seed
await entity @e[type=item,distance=..3,nbt={Item:{components:{"minecraft:custom_data":{stardust:{stardust_fragment:true}}}}}]
