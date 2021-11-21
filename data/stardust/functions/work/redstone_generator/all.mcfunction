execute if block ~ ~ ~ minecraft:furnace{Items:[{Slot:0b,id:"minecraft:redstone"}],BurnTime:0s} run function stardust:work/redstone_generator/redstone
execute if block ~ ~ ~ minecraft:furnace{Items:[{Slot:0b,id:"minecraft:redstone_block"}],BurnTime:0s} run function stardust:work/redstone_generator/redstone_block
execute store result score Temp SF_Data run data get block ~ ~ ~ BurnTime
execute if score Temp SF_Data matches 1.. run scoreboard players add @s EF_kJ 100
execute if score Temp SF_Data matches 1.. run playsound stardust:redstone_generator block @a[distance=..10] ~ ~ ~ 0.25
execute if score @s EF_kJ matches 800.. run scoreboard players set @s EF_kJ 800
