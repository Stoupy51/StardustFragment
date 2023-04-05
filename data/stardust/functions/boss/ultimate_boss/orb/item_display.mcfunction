
#> stardust:boss/ultimate_boss/orb/item_display
#
# @within			stardust:boss/ultimate_boss/orb/entity
# @executed			in stardust:ultimate at a valid random position
#
# @description		Spawns the orb entity at the given position
#

# Tag remove
tag @s remove stardust.new

# Apply nbt to passengers
execute on passengers run item replace entity @s container.0 with cobblestone{Enchantments:[{id:"protection",lvl:0s}],CustomModelData:2013397}
execute on passengers run data modify entity @s transformation.scale set value [1.75f,1.75f,1.75f]
execute on passengers run data modify entity @s transformation.translation set value [0.0f,-1.10f]
execute on passengers run tag @s add stardust.ultimate_orb
execute on passengers run effect give @s glowing infinite

