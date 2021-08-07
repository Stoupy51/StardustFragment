data modify entity @s CustomName set value '[{"text":"U","color":"dark_purple","bold":"true"},{"text":"l","color":"blue"},{"text":"t","color":"dark_aqua"},{"text":"i","color":"aqua"},{"text":"m","color":"green"},{"text":"a","color":"yellow"},{"text":"t","color":"gold"},{"text":"e","color":"dark_red"},{"text":" B","color":"dark_purple"},{"text":"o","color":"blue"},{"text":"s","color":"dark_aqua"},{"text":"s","color":"aqua"}]'
attribute @s minecraft:generic.attack_damage modifier add 1-1-1-1-1 1 10 multiply_base
attribute @s minecraft:generic.max_health modifier add 1-1-1-1-2 2 235 multiply_base
data modify entity @s AbsorptionAmount set value 45976
data modify entity @s Health set value 1024
data modify entity @s Glowing set value 1
data modify entity @s ActiveEffects set value [{Id:11,Amplifier:3,Duration:2147483647,ShowParticles:0b}]
tag @s add SF_UltimateBoss
tag @s add SF_Dragon
summon minecraft:ender_dragon ~ ~-20 ~ {Health:1024,Attributes:[{Name:"generic.max_health",Base:1024}],Silent:1,Tags:["SF_Dragon"],AbsorptionAmount:3072.0f}
summon minecraft:ender_dragon ~ ~-40 ~ {Health:1024,Attributes:[{Name:"generic.max_health",Base:1024}],Silent:1,Tags:["SF_Dragon"],AbsorptionAmount:3072.0f}
summon minecraft:ender_dragon ~ ~-60 ~ {Health:1024,Attributes:[{Name:"generic.max_health",Base:1024}],Silent:1,Tags:["SF_Dragon"],AbsorptionAmount:3072.0f}
tag @e[distance=0..,type=minecraft:ender_dragon,nbt={Brain:{memories:{}}}] add SF_Dragon
execute as @a at @s run playsound minecraft:entity.wither.spawn master @s
tellraw @a ["",{"text":"[Stardust","color":"dark_aqua"},{"text":"Fragment] ","color":"aqua"},{"text":"The "},{"text":"U","color":"dark_purple"},{"text":"l","color":"blue"},{"text":"t","color":"dark_aqua"},{"text":"i","color":"aqua"},{"text":"m","color":"green"},{"text":"a","color":"yellow"},{"text":"t","color":"gold"},{"text":"e","color":"dark_red"},{"text":" B","color":"dark_purple"},{"text":"o","color":"blue"},{"text":"s","color":"dark_aqua"},{"text":"s","color":"aqua"},{"text":" has been awakened !"}]
scoreboard players set UltimateBoss SF_Data 1
scoreboard players add @e[type=minecraft:ender_dragon,tag=SF_Dragon,limit=1,sort=random] SF_Data 17
scoreboard players add @e[type=minecraft:ender_dragon,tag=SF_Dragon,limit=1,sort=random] SF_Data 9
scoreboard players add @e[type=minecraft:ender_dragon,tag=SF_Dragon,limit=1,sort=random] SF_Data 5
