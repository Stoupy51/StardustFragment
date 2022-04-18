
execute store result score #health stardust.data run data get entity @s Health 1
execute if score #health stardust.data matches ..5 run tag @s add stardust.dragon_dead
execute if score #health stardust.data matches ..5 as @e[type=ender_dragon,tag=stardust.ultimate_boss,limit=1] run function stardust:boss/ultimate_boss/killed_slave
