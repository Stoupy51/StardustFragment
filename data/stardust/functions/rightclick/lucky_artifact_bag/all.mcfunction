clear @s minecraft:warped_fungus_on_a_stick{SF_LuckyArtifactBag:1b} 1
summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["SF_LuckyArtifactBag"]}
execute as @e[type=area_effect_cloud,tag=SF_LuckyArtifactBag,limit=1] run function stardust:rightclick/lucky_artifact_bag/get_random
summon item ~ ~ ~ {Item:{id:"minecraft:cobblestone",Count:64b,tag:{SF_Give:1b}}}
execute if score Random SF_Data matches 0 run data modify entity @e[type=item,nbt={Item:{tag:{SF_Give:1b}}},distance=..1,limit=1] Item set from storage stardust:items all.2013156
execute if score Random SF_Data matches 1 run data modify entity @e[type=item,nbt={Item:{tag:{SF_Give:1b}}},distance=..1,limit=1] Item set from storage stardust:items all.2013157
execute if score Random SF_Data matches 2 run data modify entity @e[type=item,nbt={Item:{tag:{SF_Give:1b}}},distance=..1,limit=1] Item set from storage stardust:items all.2013158
playsound stardust:lucky_artifact_bag player @a[distance=..20] ~ ~ ~ 0.25
scoreboard players reset Random SF_Data
