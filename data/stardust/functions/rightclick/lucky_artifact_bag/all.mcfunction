clear @s minecraft:warped_fungus_on_a_stick{StardustFragment_LuckyArtifactBag:1b} 1
summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["StardustFragment_LuckyArtifactBag"]}
execute as @e[type=area_effect_cloud,tag=StardustFragment_LuckyArtifactBag,limit=1] run function stardust:rightclick/lucky_artifact_bag/get_random
summon item ~ ~ ~ {Item:{id:"minecraft:cobblestone",Count:64b,tag:{StardustFragment_Give:1b}}}
execute if score Random StardustFragment_Data matches 0 run data modify entity @e[type=item,nbt={Item:{tag:{StardustFragment_Give:1b}}},distance=..1,limit=1] Item set from storage stardust:items all.2013156
execute if score Random StardustFragment_Data matches 1 run data modify entity @e[type=item,nbt={Item:{tag:{StardustFragment_Give:1b}}},distance=..1,limit=1] Item set from storage stardust:items all.2013157
execute if score Random StardustFragment_Data matches 2 run data modify entity @e[type=item,nbt={Item:{tag:{StardustFragment_Give:1b}}},distance=..1,limit=1] Item set from storage stardust:items all.2013158
playsound stardust:lucky_artifact_bag player @a[distance=..20] ~ ~ ~ 0.25
scoreboard players reset Random StardustFragment_Data
