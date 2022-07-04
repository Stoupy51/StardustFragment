
execute store result score #hurt_time stardust.data run data get storage stardust:main temp.HurtTime
data modify entity @s Rotation set from storage stardust:main temp.Rotation

execute if score @s stardust.cooldown matches 0 run scoreboard players set #temp stardust.data 1
execute if score @s stardust.cooldown matches 0 unless score #hurt_time stardust.data matches 0 run scoreboard players set #temp stardust.data 2
execute if score #temp stardust.data matches 2 run scoreboard players operation @s stardust.cooldown = #hurt_time stardust.data

scoreboard players remove @s[scores={stardust.cooldown=1..}] stardust.cooldown 1
