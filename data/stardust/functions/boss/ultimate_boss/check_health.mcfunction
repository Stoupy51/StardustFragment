
execute store result score #health stardust.data run data get entity @s Health
execute if score #health stardust.data matches ..5 run tag @s add stardust.dragon_dead
execute if score #health stardust.data matches ..5 run effect give @s resistance 99999 4 true
execute if score #health stardust.data matches ..5 as @e[tag=stardust.ultimate_boss,limit=1] run function stardust:boss/ultimate_boss/killed_slave
