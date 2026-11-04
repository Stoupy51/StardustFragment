# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

loot replace entity @s weapon.mainhand loot stardust:i/home_travel_staff
tp @s ~2.5 ~ ~2.5
dummy @s use
await score @s stardust.travel_staff_cooldown matches 1..

tp @s ~3.5 ~ ~2.5
execute at @s run function stardust:utils/home_travel_staff/check
assert chat "cancelled because you moved" @s
execute positioned ~3.5 ~ ~2.5 run assert entity @s[distance=..0.1]