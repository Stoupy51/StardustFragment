execute store result score #temp stardust.data run data get entity @s Pos[1] 0.1

execute if score #temp stardust.data matches 6 run scoreboard players add @s energy.storage 2
execute if score #temp stardust.data matches 7 run scoreboard players add @s energy.storage 4
execute if score #temp stardust.data matches 8 run scoreboard players add @s energy.storage 6
execute if score #temp stardust.data matches 9 run scoreboard players add @s energy.storage 8
execute if score #temp stardust.data matches 10 run scoreboard players add @s energy.storage 10
execute if score #temp stardust.data matches 11 run scoreboard players add @s energy.storage 12
execute if score #temp stardust.data matches 12 run scoreboard players add @s energy.storage 14
execute if score #temp stardust.data matches 13 run scoreboard players add @s energy.storage 16
execute if score #temp stardust.data matches 14 run scoreboard players add @s energy.storage 18
execute if score #temp stardust.data matches 15.. run scoreboard players add @s energy.storage 20

execute if score @s energy.storage >= @s energy.max_storage run scoreboard players operation @s energy.storage = @s energy.max_storage
