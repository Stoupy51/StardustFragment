
#Update model depending on HurtTime & Applying entity rotation
execute if entity @s[tag=stardust.hurt] if score #hurt_time stardust.data matches 0 run scoreboard players set #temp stardust.data 1
execute if entity @s[tag=!stardust.hurt] unless score #hurt_time stardust.data matches 0 run scoreboard players set #temp stardust.data 2
execute if score #temp stardust.data matches 1 run tag @s remove stardust.hurt
execute if score #temp stardust.data matches 1 run data modify entity @s ArmorItems[3].tag.CustomModelData set value 2013005
execute if score #temp stardust.data matches 2 run tag @s add stardust.hurt
execute if score #temp stardust.data matches 2 run data modify entity @s ArmorItems[3].tag.CustomModelData set value 2013006
execute if score #success stardust.data matches 1 run data modify entity @s Rotation set from storage stardust:main temp.Rotation
