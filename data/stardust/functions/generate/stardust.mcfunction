#Define a -/+ value offset randomly with UUID.
#I divide values by 10 to keep a digit
#X can take a value between -40 & +40   Examples : -37.4, 14.3, 0.1, ...
#Y can take a value between -25 & +25   Examples : -7.7, 2.3, 0.1, ...
#Z can take a value between -40 & +40   Examples : -37.4, 14.3, 0.1, ...
    scoreboard players set 400 SF_Data 400
    scoreboard players set 250 SF_Data 250
    scoreboard players set -1 SF_Data -1
    execute store result score X SF_Data run data get entity @s UUID[1] 1
    execute store result score Y SF_Data run data get entity @s UUID[2] 1
    execute store result score Z SF_Data run data get entity @s UUID[3] 1
    scoreboard players operation NewX SF_Data = X SF_Data
    scoreboard players operation NewY SF_Data = Y SF_Data
    scoreboard players operation NewZ SF_Data = Z SF_Data
    scoreboard players operation NewX SF_Data %= 400 SF_Data
    scoreboard players operation NewY SF_Data %= 250 SF_Data
    scoreboard players operation NewZ SF_Data %= 400 SF_Data
    execute if score X SF_Data matches ..-1 run scoreboard players operation NewX SF_Data *= -1 SF_Data
    execute if score Y SF_Data matches ..-1 run scoreboard players operation NewY SF_Data *= -1 SF_Data
    execute if score Z SF_Data matches ..-1 run scoreboard players operation NewZ SF_Data *= -1 SF_Data
    execute store result score PosX SF_Data run data get entity @s Pos[0] 10
    execute store result score PosY SF_Data run data get entity @s Pos[1] 10
    execute store result score PosZ SF_Data run data get entity @s Pos[2] 10

#I add the offset to the coordinates
    scoreboard players operation PosX SF_Data += NewX SF_Data
    scoreboard players operation PosY SF_Data += NewY SF_Data
    scoreboard players operation PosZ SF_Data += NewZ SF_Data
    execute store result entity @s Pos[0] double 0.1 run scoreboard players get PosX SF_Data
    execute store result entity @s Pos[1] double 0.1 run scoreboard players get PosY SF_Data
    execute store result entity @s Pos[2] double 0.1 run scoreboard players get PosZ SF_Data

#Placing Ore
    execute at @s if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/stardust_type
    execute at @s positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/stardust_type
    execute at @s positioned ~ ~0.5 ~0.5 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/stardust_type
    execute at @s positioned ~0.5 ~0.5 ~ if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/stardust_type
    execute at @s positioned ~0.5 ~ ~0.5 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/stardust_type
    execute at @s positioned ~ ~0.5 ~ if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/stardust_type
kill @s
