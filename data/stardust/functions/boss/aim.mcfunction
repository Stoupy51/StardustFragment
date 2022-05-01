
execute store result score #x stardust.data run data get entity @s Pos[0] 1000000
execute store result score #y stardust.data run data get entity @s Pos[1] 1000000
execute store result score #z stardust.data run data get entity @s Pos[2] 1000000

tp @s ^ ^ ^0.001

execute store result score #dx stardust.data run data get entity @s Pos[0] 1000000
execute store result score #dy stardust.data run data get entity @s Pos[1] 1000000
execute store result score #dz stardust.data run data get entity @s Pos[2] 1000000

scoreboard players operation #dx stardust.data -= #x stardust.data
scoreboard players operation #dy stardust.data -= #y stardust.data
scoreboard players operation #dz stardust.data -= #z stardust.data

execute store result entity @s Motion[0] double 0.006 run scoreboard players get #dx stardust.data
execute store result entity @s Motion[1] double 0.006 run scoreboard players get #dy stardust.data
execute store result entity @s Motion[2] double 0.006 run scoreboard players get #dz stardust.data

tag @s remove stardust.to_throw
scoreboard players add @s stardust.data 1
