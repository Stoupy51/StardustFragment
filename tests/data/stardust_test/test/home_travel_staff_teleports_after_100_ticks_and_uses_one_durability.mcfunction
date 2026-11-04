# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

loot replace entity @s weapon.mainhand loot stardust:i/home_travel_staff
tp @s ~2.5 ~ ~2.5
dummy @s use
await score @s stardust.travel_staff_cooldown matches 1..
assert items entity @s weapon.mainhand *[custom_data~{stardust:{home_travel_staff:true}},minecraft:damage=1]

scoreboard players operation #ticks_left stardust_test.data = @s stardust.travel_staff_cooldown
scoreboard players operation #ticks_left stardust_test.data -= #global_tick stardust.data
assert score #ticks_left stardust_test.data matches 95..100

# Runs the check the 100 ticks schedule ends with, for this dummy only
execute at @s run function stardust:utils/home_travel_staff/check
assert entity @s[advancements={stardust:visible/stuff/home_travel_staff=true}]
execute positioned ~2.5 ~ ~2.5 run assert not entity @s[distance=..1]