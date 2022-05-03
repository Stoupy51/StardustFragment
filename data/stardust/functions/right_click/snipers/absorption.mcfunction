scoreboard players operation #absorption stardust.data -= #bullet_damage stardust.data
execute store result entity @s AbsorptionAmount float 1 run scoreboard players get #absorption stardust.data

execute store result score #health stardust.data run data get entity @s Health 1
execute if score #absorption stardust.data matches ..0 run scoreboard players operation #health stardust.data += #absorption stardust.data
execute store result entity @s Health float 1 run scoreboard players get #health stardust.data
