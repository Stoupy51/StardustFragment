# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

loot replace entity @s weapon.mainhand loot stardust:i/lucky_artifact_bag
item modify entity @s weapon.mainhand {type:"minecraft:set_count",count:2}
dummy @s use
await items entity @s container.* *[custom_data~{stardust:{health_artifact_lv1:true}}|custom_data~{stardust:{damage_artifact_lv1:true}}|custom_data~{stardust:{speed_artifact_lv1:true}}|custom_data~{stardust:{health_artifact_lv2:true}}|custom_data~{stardust:{damage_artifact_lv2:true}}|custom_data~{stardust:{speed_artifact_lv2:true}}]
assert result 1 run clear @s *[custom_data~{stardust:{lucky_artifact_bag:true}}] 0