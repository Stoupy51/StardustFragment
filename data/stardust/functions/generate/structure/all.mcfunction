#Define a positive value randomly with UUID.
    scoreboard players set 1000 SF_Data 1000
    execute store result score Random SF_Data run data get entity @s UUID[1] 1
    scoreboard players operation Random SF_Data %= 1000 SF_Data

#Choose a Structure
    execute if score Random SF_Data matches 0..20 run function stardust:generate/structure/water_well/all


kill @s
