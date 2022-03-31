
tag @s add stardust.temp
execute store result score #chunk stardust.data run forceload query ~ ~
execute if score #chunk stardust.data matches 0 run forceload add ~ ~
summon armor_stand ~ ~ ~ {Invulnerable:1b,Invisible:1b,Marker:1b,Tags:["stardust.load_end","global.ignore","global.ignore.kill"]}
execute in minecraft:the_end run tp @s 0 69 0
effect give @s slow_falling 2 255 true
schedule function stardust:dimensions/end/done 2s replace
