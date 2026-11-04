# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

loot replace entity @s weapon.mainhand loot stardust:i/dragon_pearl
summon minecraft:ender_pearl ~2.5 ~2 ~2.5 {NoGravity:1b,Motion:[1.0d,0.0d,0.0d],Item:{id:"minecraft:ender_pearl",components:{"minecraft:custom_data":{stardust:{dragon_pearl:true}}}}}
execute positioned ~2.5 ~2 ~2.5 run function stardust:advancements/ender_pearl
execute positioned ~2.5 ~2 ~2.5 store result score #motion stardust_test.data run data get entity @n[type=ender_pearl,distance=..0.5] Motion[0] 1000
assert score #motion stardust_test.data matches 1500
execute positioned ~2.5 ~2 ~2.5 run kill @e[type=ender_pearl,distance=..0.5]

loot replace entity @s weapon.mainhand loot stardust:i/ender_dragon_pearl
summon minecraft:ender_pearl ~2.5 ~2 ~2.5 {NoGravity:1b,Motion:[1.0d,0.0d,0.0d],Item:{id:"minecraft:ender_pearl",components:{"minecraft:custom_data":{stardust:{ender_dragon_pearl:true}}}}}
execute positioned ~2.5 ~2 ~2.5 run function stardust:advancements/ender_pearl
execute positioned ~2.5 ~2 ~2.5 store result score #motion stardust_test.data run data get entity @n[type=ender_pearl,distance=..0.5] Motion[0] 1000
assert score #motion stardust_test.data matches 2000