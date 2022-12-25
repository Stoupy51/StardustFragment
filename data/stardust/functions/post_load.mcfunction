
## Others
execute unless score #end_built stardust.data matches 2 as @r at @s run function stardust:dimensions/end/all
execute unless score #dungeon_built stardust.data matches 2 in stardust:dungeon run function stardust:dimensions/structure/dungeon
execute unless score #ultimate_built stardust.data matches 2 in stardust:ultimate run function stardust:dimensions/structure/ultimate
execute unless entity @a run schedule function simplenergy:post_load 1t replace
execute unless entity @a run schedule function stardust:post_load 1t replace
execute if entity @p store result score #game_version load.status run data get entity @p DataVersion


## Check if Stardust Fragment is loadable (dependencies)
scoreboard players set #error load.status 0
execute if score #error load.status matches 0 unless score #game_version load.status matches 3105.. run scoreboard players set #error load.status 1
execute if score #error load.status matches 0 unless score #SimplEnergyLoaded load.status matches 1 run scoreboard players set #error load.status 2
execute if score #error load.status matches 0 unless score SimplEnergy load.status matches 1099..1100 run scoreboard players set #error load.status 3
execute if score #error load.status matches 0 unless score #smithed.damage.major load.status matches 0.. run scoreboard players set #error load.status 4

# Decode error
execute if score #error load.status matches 1 run tellraw @a {"text":"Stardust Fragment Error: This version is made for Minecraft 1.19+.","color":"red"}
execute if score #error load.status matches 2 run tellraw @a {"text":"Stardust Fragment Error: SimplEnergy v1.9.x is missing, click [here] to download","italic":false,"color":"red","clickEvent":{"action":"open_url","value":"https://www.planetminecraft.com/data-pack/simplenergy/"}}
execute if score #error load.status matches 3 run tellraw @a {"text":"Stardust Fragment Error: SimplEnergy v1.9.x is required, click [here] to download","italic":false,"color":"red","clickEvent":{"action":"open_url","value":"https://www.planetminecraft.com/data-pack/simplenergy/"}}
execute if score #error load.status matches 4 run tellraw @a {"text":"Stardust Fragment Error: Libraries are missing\nplease download the right Stardust Fragment datapack\nor download each of these libraries one by one:","color":"red"}
execute if score #error load.status matches 4 unless score #smithed.damage.major load.status matches 0.. run tellraw @a {"text":"- [Smithed Custom Damage]","color":"gold","clickEvent":{"action":"open_url","value":"https://wiki.smithed.dev/libraries/damage/"}}

# Load Stardust Fragment
scoreboard players set #StardustFragmentLoaded load.status 0
execute if score #error load.status matches 0 run scoreboard players set #StardustFragmentLoaded load.status 1
execute if score #error load.status matches 0 run tellraw @a[tag=convention.debug] {"text":"[Loaded Stardust Fragment v3.4.9]","color":"green"}

