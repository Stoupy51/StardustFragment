execute store result score GameVersion load.status run data get entity @r DataVersion

execute store success score SE_Loaded SF_Data run scoreboard players get SimplEnergy load.status
execute if score SE_Loaded SF_Data matches 0 run scoreboard players set SE_Missing SF_Data 1
execute unless score SimplEnergy load.status matches 1.. run scoreboard players set SE_Missing SF_Data 1

execute if score SE_Missing SF_Data matches 1 run tellraw @a {"text":"Stardust Fragment Error: SimplEnergy v1.6.0+ is missing, click [here] to download","italic":false,"color":"red","clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/SimplEnergy/releases"}}

execute unless score GameVersion load.status matches 2860.. run tellraw @a {"text":"Stardust Fragment Error: This version only works with Minecraft 1.18+.","italic":false,"color":"red"}
execute unless score SE_Missing SF_Data matches 1 unless score SimplEnergy load.status matches 1060.. run tellraw @a {"text":"Stardust Fragment Error: SimplEnergy v1.6.0+ is required, click [here] to download","italic":false,"color":"red","clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/SimplEnergy/releases"}}
#execute if score GameVersion load.status matches 2860.. if score SimplEnergy load.status matches 1060.. run tellraw @a {"text":"[Loaded Stardust Fragment v3.2.0]","italic":false,"color":"green"}

scoreboard players reset SE_Loaded SF_Data
scoreboard players reset SE_Missing SF_Data

execute unless score EndBuilt SF_Data matches 1 as @r at @s run function stardust:dimensions/end/all
execute unless score DungeonBuilt SF_Data matches 1 in stardust:dungeon run function stardust:dimensions/structure/dungeon
execute unless score UltimateBuilt SF_Data matches 1 in stardust:ultimate run function stardust:dimensions/structure/ultimate
execute unless entity @a run schedule function stardust:post_load 1t replace
