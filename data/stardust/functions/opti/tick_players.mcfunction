
execute if score @s StardustFragment_RightClick matches 1.. run function stardust:rightclick/all
scoreboard players remove @s[scores={StardustFragment_Cooldown=1..}] StardustFragment_Cooldown 1
scoreboard players add @s[scores={StardustFragment_X=..-1}] StardustFragment_X 1
