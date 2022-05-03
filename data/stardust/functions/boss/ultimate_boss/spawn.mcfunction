data modify entity @s CustomName set value '[{"text":"U","italic":false,"color":"dark_purple","bold":"true"},{"text":"l","italic":false,"color":"blue"},{"text":"t","italic":false,"color":"dark_aqua"},{"text":"i","italic":false,"color":"aqua"},{"text":"m","italic":false,"color":"green"},{"text":"a","italic":false,"color":"yellow"},{"text":"t","italic":false,"color":"gold"},{"text":"e","italic":false,"color":"dark_red"},{"text":" B","italic":false,"color":"dark_purple"},{"text":"o","italic":false,"color":"blue"},{"text":"s","italic":false,"color":"dark_aqua"},{"text":"s","italic":false,"color":"aqua"}]'
attribute @s minecraft:generic.attack_damage modifier add 1-1-1-1-1 "1" 10 multiply_base
attribute @s minecraft:generic.max_health modifier add 1-1-1-1-2 "2" 235 multiply_base
data modify entity @s AbsorptionAmount set value 45976
data modify entity @s Health set value 1024
data modify entity @s Glowing set value 1
data modify entity @s ActiveEffects set value [{Id:11,Amplifier:3,Duration:2147483647,ShowParticles:0b}]
tag @s add stardust.ultimate_boss
tag @s add stardust.dragon
team join stardust.team @s

scoreboard players operation #temp stardust.data = UltimateSlaveCount stardust.config
execute if score #temp stardust.data matches 1.. positioned ~ ~-20 ~ run function stardust:boss/ultimate_boss/summon_slave

tag @e[distance=0..,type=ender_dragon,nbt={Brain:{memories:{}}}] add stardust.dragon
execute as @a at @s run playsound entity.wither.spawn master @s
tellraw @a ["",{"text":"[Stardust","italic":false,"color":"dark_aqua"},{"text":"Fragment] ","italic":false,"color":"aqua"},{"text":"The "},{"text":"U","italic":false,"color":"dark_purple"},{"text":"l","italic":false,"color":"blue"},{"text":"t","italic":false,"color":"dark_aqua"},{"text":"i","italic":false,"color":"aqua"},{"text":"m","italic":false,"color":"green"},{"text":"a","italic":false,"color":"yellow"},{"text":"t","italic":false,"color":"gold"},{"text":"e","italic":false,"color":"dark_red"},{"text":" B","italic":false,"color":"dark_purple"},{"text":"o","italic":false,"color":"blue"},{"text":"s","italic":false,"color":"dark_aqua"},{"text":"s","italic":false,"color":"aqua"},{"text":" has been awakened !"}]
scoreboard players set #ultimate_boss stardust.data 1
scoreboard players add @e[type=ender_dragon,tag=stardust.dragon,limit=1,sort=random] stardust.data 17
scoreboard players add @e[type=ender_dragon,tag=stardust.dragon,limit=1,sort=random] stardust.data 9
scoreboard players add @e[type=ender_dragon,tag=stardust.dragon,limit=1,sort=random] stardust.data 5
