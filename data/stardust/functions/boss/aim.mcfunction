execute store result score X stardust.data run data get entity @s Pos[0] 1000000
execute store result score Y stardust.data run data get entity @s Pos[1] 1000000
execute store result score Z stardust.data run data get entity @s Pos[2] 1000000

tp @s ^ ^ ^0.001

execute store result score Dx stardust.data run data get entity @s Pos[0] 1000000
execute store result score Dy stardust.data run data get entity @s Pos[1] 1000000
execute store result score Dz stardust.data run data get entity @s Pos[2] 1000000

scoreboard players operation Dx stardust.data -= X stardust.data
scoreboard players operation Dy stardust.data -= Y stardust.data
scoreboard players operation Dz stardust.data -= Z stardust.data

execute store result entity @s Motion[0] double 0.006 run scoreboard players get Dx stardust.data
execute store result entity @s Motion[1] double 0.006 run scoreboard players get Dy stardust.data
execute store result entity @s Motion[2] double 0.006 run scoreboard players get Dz stardust.data

tag @s remove stardust.to_throw
scoreboard players add @s stardust.data 1
