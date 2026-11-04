# @template stardust_test:room
# @environment stardust_test:portal_without_energy
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

loot replace entity @s weapon.mainhand loot stardust:i/cavern_portal
item modify entity @s weapon.mainhand {type:"minecraft:set_count",count:2}
dummy @s use block ~2 ~-1 ~2
execute positioned ~2.5 ~.5 ~2.5 run await entity @e[type=item_display,tag=stardust.cavern_portal,distance=..0.5]

# 19 is one short of the 20 a second the portal burns
execute positioned ~2.5 ~.5 ~2.5 run scoreboard players set @n[type=item_display,tag=stardust.cavern_portal,distance=..0.5] energy.storage 19
tp @s ~2.5 ~1 ~2.5
execute positioned ~2.5 ~.5 ~2.5 as @n[type=item_display,tag=stardust.cavern_portal,distance=..0.5] at @s run function stardust:custom_blocks/cavern_portal/second

assert not score @s stardust.teleportation matches -2147483648..
assert not data entity @s active_effects[{id:"minecraft:nausea"}]
execute positioned ~2.5 ~.5 ~2.5 run assert score @n[type=item_display,tag=stardust.cavern_portal,distance=..0.5] energy.storage matches 19
