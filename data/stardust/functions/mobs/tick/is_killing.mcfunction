
data modify storage stardust:temp all set from entity @s
scoreboard players set #temp stardust.data 2
scoreboard players set #death stardust.data 1

summon armor_stand ~ ~ ~ {Tags:["stardust.new"],Invisible:1b,NoBasePlate:1b,NoGravity:1b,Marker:1b,ArmorItems:[],Pose:{Head:[0f,0f,0.001f]}}
execute as @e[tag=stardust.new] run function stardust:mobs/tick/death/copy
kill @s
