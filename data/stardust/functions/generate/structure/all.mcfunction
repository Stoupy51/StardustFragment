#Randomize a bit the position of the structure
	function stardust:generate/structure/position_variation

#Define a positive value randomly with UUID.
	scoreboard players set 500 StardustFragment_Data 500
	execute store result score Random StardustFragment_Data run seed
	execute store result score PosX StardustFragment_Data run data get entity @s Pos[0]
	execute store result score PosZ StardustFragment_Data run data get entity @s Pos[2]
	scoreboard players operation PosX StardustFragment_Data *= Random StardustFragment_Data
	scoreboard players operation PosZ StardustFragment_Data *= Random StardustFragment_Data
	scoreboard players operation Random StardustFragment_Data += PosX StardustFragment_Data
	scoreboard players operation Random StardustFragment_Data += PosZ StardustFragment_Data
	scoreboard players operation Random StardustFragment_Data %= 500 StardustFragment_Data
	execute at @s if entity @e[type=bat,tag=StardustFragment_Structure,distance=..250] run scoreboard players set Random StardustFragment_Data 500
#Choose a Structure
	execute if score Random StardustFragment_Data matches 0..19 at @s run function stardust:generate/structure/water_well/all
	execute if score Random StardustFragment_Data matches 20..269 at @s run function stardust:generate/structure/scruffy_house/all
	execute if score Random StardustFragment_Data matches 270..299 at @s run function stardust:generate/structure/graveyard/all
	execute if score Random StardustFragment_Data matches 300..309 in stardust:stardust at @s[distance=0..] run function stardust:generate/structure/flying_saucer/all
	execute if score Random StardustFragment_Data matches 310..319 at @s run function stardust:generate/structure/floating_island_awakened/all
	execute if score Random StardustFragment_Data matches 320..329 at @s run function stardust:generate/structure/floating_island_enchant/all

#tellraw @a {"score":{"name":"Random","objective":"StardustFragment_Data"}}
kill @s
