tag @s add StardustFragment_Temp
execute store result score Chunk StardustFragment_Data run forceload query ~ ~
execute if score Chunk StardustFragment_Data matches 0 run forceload add ~ ~
summon armor_stand ~ ~ ~ {Invulnerable:1b,Invisible:1b,Marker:1b,Tags:["StardustFragment_LoadEnd"]}
execute in minecraft:the_end run tp @s 0 69 0
effect give @s slow_falling 2 255 true
schedule function stardust:dimensions/end/done 2s replace
