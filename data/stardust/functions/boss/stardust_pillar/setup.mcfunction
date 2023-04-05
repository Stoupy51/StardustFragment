
#> stardust:boss/stardust_pillar/setup
#
# @within			stardust:mobs/stardust_pillar
# @executed			as the item display entity of the Stardust Pillar
#
# @description		Sets up the Stardust Pillar's data and model.
#

# Setup Health, Angry Mode, and remove the new mob tag
execute on vehicle run scoreboard players set @s stardust.pillar 150
execute on vehicle run tag @s[predicate=!stardust:in_dim/stardust] add stardust.angry
execute on vehicle run tag @s remove stardust.new

# Setup item display
tag @s add stardust.model
tag @s add stardust.pillar_tick
data modify entity @s transformation.scale set value [1.75f,1.75f,1.75f]
data modify entity @s transformation.translation set value [0.0f,-1.10f,-0.13f]
item replace entity @s container.0 with golden_hoe{CustomModelData:2013000}

