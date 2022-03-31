execute store result score PosY stardust.data run data get entity @s Pos[1]
scoreboard players add PosY stardust.data 20
execute store result score HeightVariation stardust.data run data get entity @s UUID[2]
scoreboard players operation HeightVariation stardust.data %= #40 simplenergy.data
scoreboard players operation PosY stardust.data -= HeightVariation stardust.data
execute store result entity @s Pos[1] double 1 run scoreboard players get PosY stardust.data

scoreboard players reset PosY stardust.data
scoreboard players reset HeightVariation stardust.data
