
particle dust 0 0 255 1 ~ ~1 ~ 2 2 2 0 20

scoreboard players set #temp stardust.data 0
execute if entity @s[tag=stardust.hurt] if data entity @e[type=wither,tag=stardust.stardust_pillar,distance=..3,limit=1,sort=nearest] {HurtTime:0s} run scoreboard players set #temp stardust.data 1
execute if entity @s[tag=!stardust.hurt] unless data entity @e[type=wither,tag=stardust.stardust_pillar,distance=..3,limit=1,sort=nearest] {HurtTime:0s} run scoreboard players set #temp stardust.data 2

execute if score #temp stardust.data matches 1 run tag @s remove stardust.hurt
execute if score #temp stardust.data matches 1 run data modify entity @s ArmorItems[3].tag.CustomModelData set value 2013000
execute if score #temp stardust.data matches 2 run tag @s add stardust.hurt
execute if score #temp stardust.data matches 2 run data modify entity @s ArmorItems[3].tag.CustomModelData set value 2013001


