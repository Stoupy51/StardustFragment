
scoreboard players set #killed stardust.data 1
execute if block ~ ~ ~ moss_carpet run setblock ~ ~ ~ air
execute unless entity @e[type=item,nbt={Item:{id:"minecraft:moss_carpet"}},limit=1,sort=nearest,distance=..1] run summon item ~ ~ ~ {Motion:[0.00,0.20,0.00],Item:{id:"minecraft:moss_carpet",Count:1b}}
tag @e[type=item,nbt={Item:{id:"minecraft:moss_carpet"}},limit=1,sort=nearest,distance=..1] add stardust.drop

execute if entity @s[tag=stardust.diamond_seed] run function stardust:destroy/seeds/diamond
execute if entity @s[tag=stardust.advanced_diamond_seed] run function stardust:destroy/seeds/advanced_diamond
execute if entity @s[tag=stardust.stardust_seed] run function stardust:destroy/seeds/stardust
execute if entity @s[tag=stardust.advanced_stardust_seed] run function stardust:destroy/seeds/advanced_stardust
execute if entity @s[tag=stardust.elite_stardust_seed] run function stardust:destroy/seeds/elite_stardust
execute if entity @s[tag=stardust.legendarium_seed] run function stardust:destroy/seeds/legendarium
execute if entity @s[tag=stardust.solarium_seed] run function stardust:destroy/seeds/solarium
execute if entity @s[tag=stardust.darkium_seed] run function stardust:destroy/seeds/darkium

# Kill the entity and remove the drop tag
tag @e[type=item,tag=stardust.drop] remove stardust.drop
kill @s

