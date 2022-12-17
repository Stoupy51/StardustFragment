
#Score and storage init
tag @s add stardust.temp
data modify storage stardust:temp all set from entity @e[type=!armor_stand,tag=stardust.stardust_mob,distance=..10,predicate=stardust:has_temp_passenger,limit=1]
tag @s remove stardust.temp
scoreboard players set #hurt_time stardust.data 0
execute store result score #hurt_time stardust.data run data get storage stardust:temp all.HurtTime

#Apply rotation
data modify entity @s Rotation set from storage stardust:temp all.Rotation

#Hurt time cooldown
scoreboard players add @s stardust.cooldown 0
execute if score @s stardust.cooldown matches 0 run scoreboard players set #temp stardust.data 1
execute if score @s stardust.cooldown matches 0 unless score #hurt_time stardust.data matches 0 run scoreboard players set #temp stardust.data 2
execute if score #temp stardust.data matches 2 run scoreboard players operation @s stardust.cooldown = #hurt_time stardust.data
scoreboard players remove @s[scores={stardust.cooldown=1..}] stardust.cooldown 1

