
execute if data block ~ ~ ~ {Items:[{Slot:0b,id:"minecraft:redstone"}],BurnTime:0s} run function stardust:work/redstone_generator/redstone
execute if data block ~ ~ ~ {Items:[{Slot:0b,id:"minecraft:redstone_block"}],BurnTime:0s} run function stardust:work/redstone_generator/redstone_block
execute store result score #temp stardust.data run data get block ~ ~ ~ BurnTime
execute if score #temp stardust.data matches 1.. run scoreboard players add @s energy.storage 100
execute if score #temp stardust.data matches 1.. run playsound stardust:redstone_generator block @a[distance=..10] ~ ~ ~ 0.25
execute if score @s energy.storage >= @s energy.max_storage run scoreboard players operation @s energy.storage = @s energy.max_storage
