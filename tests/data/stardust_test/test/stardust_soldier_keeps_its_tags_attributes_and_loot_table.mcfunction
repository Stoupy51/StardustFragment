# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

summon minecraft:skeleton ~2.5 ~ ~2.5 {NoAI:1b,PersistenceRequired:1b,Tags:["stardust_test.soldier"]}
execute as @n[type=skeleton,tag=stardust_test.soldier] at @s run function stardust:mobs/stardust_soldier/convert
await delay 50
assert entity @e[type=skeleton,tag=stardust_test.soldier,tag=stardust.stardust_soldier,tag=stardust.mob_entity,tag=stardust.stardust_mob,team=stardust.mob]
assert entity @e[type=skeleton,tag=stardust_test.soldier,nbt={DeathLootTable:"stardust:entities/stardust_dimension"}]
assert result 40 run attribute @n[type=skeleton,tag=stardust_test.soldier] minecraft:max_health get
assert entity @e[type=item_display,tag=stardust.mob_model,distance=..5]
