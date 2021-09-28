execute store success score EF_Loaded SF_Data run scoreboard players get EnergyFlux EF_Versions
execute if score EF_Loaded SF_Data matches 0 run scoreboard players set EF_Missing SF_Data 1
execute unless score EnergyFlux EF_Versions matches 1.. run scoreboard players set EF_Missing SF_Data 1

execute store success score SE_Loaded SF_Data run scoreboard players get SimplEnergy EF_Versions
execute if score SE_Loaded SF_Data matches 0 run scoreboard players set SE_Missing SF_Data 1
execute unless score SimplEnergy EF_Versions matches 1.. run scoreboard players set SE_Missing SF_Data 1

execute if score EF_Missing SF_Data matches 1 run tellraw @a {"text":"Stardust Fragment Error: Energy Flux API v1.1.5+ is missing, click [here] to download","italic":false,"color":"red","clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/EnergyFlux-API/releases"}}
execute if score SE_Missing SF_Data matches 1 run tellraw @a {"text":"Stardust Fragment Error: SimplEnergy v1.3.3+ is missing, click [here] to download","italic":false,"color":"red","clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/SimplEnergy/releases"}}

execute if score GameVersion EF_Versions matches ..2723 run tellraw @a {"text":"Stardust Fragment Error: You need at least Minecraft 1.17+.","italic":false,"color":"red"}
execute if score EnergyFlux EF_Versions matches ..1014 run tellraw @a {"text":"Stardust Fragment Error: Energy Flux API v1.1.5+ is needed, click [here] to download","italic":false,"color":"red","clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/EnergyFlux-API/releases"}}
execute if score SimplEnergy EF_Versions matches ..1032 run tellraw @a {"text":"Stardust Fragment Error: SimplEnergy v1.3.3+ is needed, click [here] to download","italic":false,"color":"red","clickEvent":{"action":"open_url","value":"https://github.com/Stoupy51/SimplEnergy/releases"}}
execute if score GameVersion EF_Versions matches 2724.. if score EnergyFlux EF_Versions matches 1015.. if score SimplEnergy EF_Versions matches 1033.. run tellraw @a {"text":"[Loaded Stardust Fragment v3.0.0]","italic":false,"color":"green"}

scoreboard players reset EF_Loaded SF_Data
scoreboard players reset SE_Loaded SF_Data
scoreboard players reset EF_Missing SF_Data
scoreboard players reset SE_Missing SF_Data

execute unless score EndBuilt SF_Data matches 1 as @r at @s run function stardust:dimensions/end/all
execute unless score DungeonBuilt SF_Data matches 1 in stardust:dungeon run function stardust:dimensions/structure/dungeon
execute unless score UltimateBuilt SF_Data matches 1 in stardust:ultimate run function stardust:dimensions/structure/ultimate
execute unless entity @a run schedule function stardust:post_load 5s replace
