#Define a -/+ value offset randomly with UUID.
#I divide values by 50 to keep a digit
#X can take a value between -40 & +40   Examples : -37.4, 14.3, 0.1, ...
#Y can take a value between -50 & +50   Examples : -7.7, 2.3, 0.1, ...
#Z can take a value between -40 & +40   Examples : -37.4, 14.3, 0.1, ...
    scoreboard players set 400 SF_Data 400
    scoreboard players set 500 SF_Data 500
    scoreboard players set 50 SF_Data 50
    execute store result score X SF_Data run data get entity @s UUID[1] 1
    execute store result score Y SF_Data run data get entity @s UUID[2] 1
    execute store result score Z SF_Data run data get entity @s UUID[3] 1
    scoreboard players operation X SF_Data %= 400 SF_Data
    scoreboard players operation Y SF_Data %= 500 SF_Data
    scoreboard players operation Z SF_Data %= 400 SF_Data
    execute store result score PosX SF_Data run data get entity @s Pos[0] 50
    execute store result score PosZ SF_Data run data get entity @s Pos[2] 50

#I add the offset to the coordinates
    scoreboard players operation PosX SF_Data += X SF_Data
    scoreboard players operation PosY SF_Data += Y SF_Data
    scoreboard players operation PosZ SF_Data += Z SF_Data
    execute store result entity @s Pos[0] double 0.1 run scoreboard players get PosX SF_Data
    execute store result entity @s Pos[1] double 0.1 run scoreboard players get PosY SF_Data
    execute store result entity @s Pos[2] double 0.1 run scoreboard players get PosZ SF_Data

#Placing Ore
    execute at @s if block ~ ~ ~ minecraft:netherrack run summon minecraft:glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SF_Destroyer","SF_AwakenedStardustOre"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:cobblestone",Count:1b,tag:{CustomModelData:2013024}}}
    execute at @s if block ~ ~ ~ minecraft:netherrack run setblock ~ ~ ~ minecraft:deepslate_redstone_ore
kill @s
