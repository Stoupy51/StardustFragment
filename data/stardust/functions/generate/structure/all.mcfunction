
execute store result score Rotation StardustFragment_Data run data get entity @s UUID[1]
scoreboard players operation Rotation StardustFragment_Data %= 4 SimplEnergy_Data
#Choose which structure
	execute if entity @s[tag=StardustFragment_AFI] run function stardust:generate/structure/awakened_floating_island
	execute if entity @s[tag=StardustFragment_EFI] run function stardust:generate/structure/enchantment_floating_island
	execute if entity @s[tag=StardustFragment_FlyingSaucer] if predicate stardust:in_stardust run function stardust:generate/structure/flying_saucer
	execute if entity @s[tag=StardustFragment_WaterWell] run function stardust:generate/structure/water_well

execute at @s run setblock ~ ~2 ~ redstone_block
execute at @s run setblock ~ ~2 ~ air

kill @s
