# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

summon minecraft:iron_golem ~2.5 ~ ~3.5 {NoAI:1b,PersistenceRequired:1b,Tags:["stardust_test.target"]}
tp @s ~2.5 ~ ~0.5 0 0
loot replace entity @s weapon.mainhand loot stardust:i/stardust_sniper
item replace entity @s hotbar.8 with minecraft:iron_nugget 2
dummy @s use
execute positioned ~2.5 ~1 ~3.5 run await entity @e[type=iron_golem,tag=stardust_test.target,distance=..1,nbt={Health:90.0f}]
assert items entity @s weapon.mainhand *[custom_data~{stardust:{stardust_sniper:true}},minecraft:damage=1]