
execute if score @s stardust.right_click matches 1.. run function stardust:right_click/all
scoreboard players remove @s[scores={stardust.cooldown=1..}] stardust.cooldown 1
scoreboard players add @s[scores={stardust.data_2=..-1}] stardust.data_2 1
