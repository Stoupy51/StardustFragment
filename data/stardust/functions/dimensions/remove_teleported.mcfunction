
scoreboard players set #temp stardust.data 0
execute store result score #temp stardust.data run data get entity @s Pos[0] 100
execute store result score #y stardust.data run data get entity @s Pos[1] 1
execute store result score #z stardust.data run data get entity @s Pos[2] 100
scoreboard players operation #temp stardust.data += #y stardust.data
scoreboard players operation #temp stardust.data += #z stardust.data

execute unless score #temp stardust.data = @s stardust.data_2 run tag @s remove stardust.teleported
