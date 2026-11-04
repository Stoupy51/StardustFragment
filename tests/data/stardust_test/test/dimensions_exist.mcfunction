# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 200
await score #stardust.loaded load.status matches 1

execute in stardust:cavern run forceload add 0 0
await delay 20
execute in stardust:cavern run setblock 0 100 0 minecraft:glowstone
execute in stardust:cavern run assert block 0 100 0 minecraft:glowstone
execute in stardust:celestial run forceload add 0 0
await delay 20
execute in stardust:celestial run setblock 0 100 0 minecraft:glowstone
execute in stardust:celestial run assert block 0 100 0 minecraft:glowstone
