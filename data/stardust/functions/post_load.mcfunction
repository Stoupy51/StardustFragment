execute store result score GameVersion load.status run data get entity @r DataVersion

execute store success score simplenergy_loaded stardust.data run scoreboard players get SimplEnergy load.status
execute if score simplenergy_loaded stardust.data matches 0 run scoreboard players set simplenergy_missing stardust.data 1
execute unless score SimplEnergy load.status matches 1.. run scoreboard players set simplenergy_missing stardust.data 1

execute if score simplenergy_missing stardust.data matches 1 run tellraw @a {"text":"Stardust Fragment Error: SimplEnergy v1.8.0+ is missing, click [here] to download","italic":false,"color":"red","clickEvent":{"action":"open_url","value":"https://www.planetminecraft.com/data-pack/simplenergy/"}}

execute unless score GameVersion load.status matches 2975.. run tellraw @a {"text":"Stardust Fragment Error: This version only available with Minecraft 1.18.2+.","italic":false,"color":"red"}
execute unless score simplenergy_missing stardust.data matches 1 unless score SimplEnergy load.status matches 1080.. run tellraw @a {"text":"Stardust Fragment Error: SimplEnergy v1.8.0+ is required, click [here] to download","italic":false,"color":"red","clickEvent":{"action":"open_url","value":"https://www.planetminecraft.com/data-pack/simplenergy/"}}
execute if score GameVersion load.status matches 2975.. if score SimplEnergy load.status matches 1080.. run tellraw @a[tag=convention.debug] {"text":"[Loaded Stardust Fragment v3.4.0]","italic":false,"color":"green"}

scoreboard players reset simplenergy_loaded stardust.data
scoreboard players reset simplenergy_missing stardust.data

execute unless score EndBuilt stardust.data matches 2 as @r at @s run function stardust:dimensions/end/all
execute unless score #dungeon_built stardust.data matches 1 in stardust:dungeon run function stardust:dimensions/structure/dungeon
execute unless score #ultimate_built stardust.data matches 1 in stardust:ultimate run function stardust:dimensions/structure/ultimate
execute unless entity @a run schedule function stardust:post_load 1t replace
