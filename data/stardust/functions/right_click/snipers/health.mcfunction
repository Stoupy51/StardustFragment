
execute store result score #health stardust.data run data get entity @s Health 1
scoreboard players operation #health stardust.data -= #bullet_damage stardust.data
execute if score #health stardust.data matches ..0 run kill @s[type=!ender_dragon]
execute if score #health stardust.data matches ..0 if entity @s[type=ender_dragon] run scoreboard players set #health stardust.data 1
execute store result entity @s Health float 1 run scoreboard players get #health stardust.data
