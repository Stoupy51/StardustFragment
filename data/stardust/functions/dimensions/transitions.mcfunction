execute store result score Y SF_Data run data get entity @s Pos[1] 1
execute if score Y SF_Data matches 500.. at @s run function stardust:dimensions/transition_up
execute if score Y SF_Data matches ..-15 at @s run function stardust:dimensions/transition_down
