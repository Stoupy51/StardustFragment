execute if block ~ ~ ~ minecraft:furnace{Items:[{Slot:0b,id:"minecraft:nether_star"}],BurnTime:0s} run function stardust:work/nether_star_generator/burn
execute store result score Temp SF_Data run data get block ~ ~ ~ BurnTime
execute if score Temp SF_Data matches 1.. run scoreboard players add @s EF_kJ 1500
execute if score Temp SF_Data matches 1.. run playsound stardust:nether_star_generator block @a[distance=..10] ~ ~ ~ 0.25
execute if score @s EF_kJ matches 30000.. run scoreboard players set @s EF_kJ 30000
