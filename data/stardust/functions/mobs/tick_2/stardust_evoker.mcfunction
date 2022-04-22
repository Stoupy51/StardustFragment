
#Score initialisation
scoreboard players set #temp stardust.data 0
scoreboard players set #success stardust.data 0
scoreboard players set #hurt_time stardust.data 0
scoreboard players operation #predicate stardust.data = @s stardust.id
execute store success score #success stardust.data run data modify storage stardust:main temp set from entity @e[type=evoker,tag=stardust.stardust_dim,dx=0,dy=0,dz=0,predicate=stardust:equals_id,limit=1]
execute if score #success stardust.data matches 1 store result score #hurt_time stardust.data run data get storage stardust:main temp.HurtTime


#Update model depending on HurtTime & Applying entity rotation
execute if entity @s[tag=stardust.hurt] if score #hurt_time stardust.data matches 0 run scoreboard players set #temp stardust.data 1
execute if entity @s[tag=!stardust.hurt] unless score #hurt_time stardust.data matches 0 run scoreboard players set #temp stardust.data 2
execute if score #temp stardust.data matches 1 run tag @s remove stardust.hurt
execute if score #temp stardust.data matches 1 run data modify entity @s ArmorItems[3].tag.CustomModelData set value 2013010
execute if score #temp stardust.data matches 2 run tag @s add stardust.hurt
execute if score #temp stardust.data matches 2 run data modify entity @s ArmorItems[3].tag.CustomModelData set value 2013011
execute if score #success stardust.data matches 1 run data modify entity @s Rotation set from storage stardust:main temp.Rotation


#Death case
execute if score #success stardust.data matches 0 run kill @s

