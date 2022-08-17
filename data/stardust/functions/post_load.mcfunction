
execute if entity @p store result score #game_version load.status run data get entity @p DataVersion

execute unless score SimplEnergy load.status matches 1098..1100 run tellraw @a {"text":"Stardust Fragment Error: SimplEnergy v1.9.x is required, click [here] to download","italic":false,"color":"red","clickEvent":{"action":"open_url","value":"https://www.planetminecraft.com/data-pack/simplenergy/"}}
execute unless score SimplEnergy load.status matches 1.. run tellraw @a {"text":"Stardust Fragment Error: SimplEnergy v1.9.x is missing, click [here] to download","italic":false,"color":"red","clickEvent":{"action":"open_url","value":"https://www.planetminecraft.com/data-pack/simplenergy/"}}
execute unless score #game_version load.status matches 3105.. run tellraw @a {"text":"Stardust Fragment Error: This version is only available with Minecraft 1.19+.","italic":false,"color":"red"}

execute if score #game_version load.status matches 3105.. if score SimplEnergy load.status matches 1098..1100 run tellraw @a[tag=convention.debug] {"text":"[Loaded Stardust Fragment v3.4.8]","italic":false,"color":"green"}

execute unless entity @a run schedule function stardust:post_load 1t replace

#Dimensions stuff
execute unless score #end_built stardust.data matches 2 as @r at @s run function stardust:dimensions/end/all
execute unless score #dungeon_built stardust.data matches 2 in stardust:dungeon run function stardust:dimensions/structure/dungeon
execute unless score #ultimate_built stardust.data matches 2 in stardust:ultimate run function stardust:dimensions/structure/ultimate
