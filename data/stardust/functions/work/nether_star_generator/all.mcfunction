
execute if data block ~ ~ ~ {Items:[{Slot:0b,id:"minecraft:nether_star"}],BurnTime:0s} run function stardust:work/nether_star_generator/burn
execute store result score #temp stardust.data run data get block ~ ~ ~ BurnTime
execute if score #temp stardust.data matches 1.. run scoreboard players add @s energy.storage 1500
execute if score #temp stardust.data matches 1.. run playsound stardust:nether_star_generator block @a[distance=..10] ~ ~ ~ 0.25
execute if score @s energy.storage >= @s energy.max_storage run scoreboard players operation @s energy.storage = @s energy.max_storage
