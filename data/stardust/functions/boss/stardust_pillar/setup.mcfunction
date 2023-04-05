
#> stardust:boss/stardust_pillar/setup
#
# @within			stardust:mobs/stardust_pillar
# @executed			as & at the Stardust Pillar
#
# @description		Sets up the Stardust Pillar's data and model.
#

# Setup Health, Angry Mode, and remove the new mob tag
scoreboard players set @s stardust.pillar 150
tag @s[predicate=!stardust:in_dim/stardust] add stardust.angry
tag @s remove stardust.new_mob

# Setup item display "on passengers"
execute on passengers run tag @s add stardust.model
execute on passengers run tag @s add stardust.pillar_tick
execute on passengers run data modify entity @s transformation.scale set value [1.75f,1.75f,1.75f]
execute on passengers run data modify entity @s transformation.translation set value [0.0f,-1.10f,-0.13f]
execute on passengers run data modify entity @s item set value {id:"minecraft:golden_hoe",Count:1b,tag:{CustomModelData:2013000}}

