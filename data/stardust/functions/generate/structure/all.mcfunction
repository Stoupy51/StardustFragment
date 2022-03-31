
execute store result score #rotation stardust.data run data get entity @s UUID[1]
scoreboard players operation #rotation stardust.data %= #4 simplenergy.data
#Choose which structure
	execute if entity @s[tag=stardust.afi] run function stardust:generate/structure/awakened_floating_island
	execute if entity @s[tag=stardust.efi] run function stardust:generate/structure/enchantment_floating_island
	execute if entity @s[tag=stardust.flying_saucer] if predicate stardust:in_stardust run function stardust:generate/structure/flying_saucer
	execute if entity @s[tag=stardust.water_well] run function stardust:generate/structure/water_well

execute at @s run setblock ~ ~2 ~ redstone_block
execute at @s run setblock ~ ~2 ~ air

kill @s
