
scoreboard players set #temp stardust.data 0
scoreboard players operation #predicate stardust.data = @s stardust.id
execute if entity @s[tag=stardust.hurt] if data entity @e[type=stray,tag=stardust.stardust_dim,distance=..3,predicate=stardust:equals_id,limit=1] {HurtTime:0s} run scoreboard players set #temp stardust.data 1
execute if entity @s[tag=!stardust.hurt] unless data entity @e[type=stray,tag=stardust.stardust_dim,distance=..3,predicate=stardust:equals_id,limit=1] {HurtTime:0s} run scoreboard players set #temp stardust.data 2

execute if score #temp stardust.data matches 1 run tag @s remove stardust.hurt
execute if score #temp stardust.data matches 1 run data modify entity @s ArmorItems[3].tag.CustomModelData set value 2013005
execute if score #temp stardust.data matches 2 run tag @s add stardust.hurt
execute if score #temp stardust.data matches 2 run data modify entity @s ArmorItems[3].tag.CustomModelData set value 2013006

#Death case
execute unless entity @e[type=stray,tag=stardust.stardust_dim,distance=..3,predicate=stardust:equals_id,limit=1] run kill @s

