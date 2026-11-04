# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

loot replace entity @s weapon.mainhand loot stardust:i/life_crystal
item modify entity @s weapon.mainhand {type:"minecraft:set_count",count:2}
dummy @s use
await score @s stardust.life_crystal matches 1
assert result 21 run attribute @s minecraft:max_health get

# The horn is used for 20 ticks, as long as the anti double use cooldown
await delay 30
assert score @s stardust.life_crystal matches 1
assert result 1 run clear @s *[custom_data~{stardust:{life_crystal:true}}] 0