#Randomize a bit the position of the structure
	function stardust:generate/structure/position_variation

#Define a positive value randomly with UUID.
	scoreboard players set 1000 SF_Data 1000
	execute store result score Random SF_Data run seed
	execute store result score PosX SF_Data run data get entity @s Pos[0]
	execute store result score PosZ SF_Data run data get entity @s Pos[2]
	scoreboard players operation PosX SF_Data *= Random SF_Data
	scoreboard players operation PosZ SF_Data *= Random SF_Data
	scoreboard players operation Random SF_Data += PosX SF_Data
	scoreboard players operation Random SF_Data += PosZ SF_Data
	scoreboard players operation Random SF_Data %= 1000 SF_Data
	execute at @s if entity @e[type=bat,tag=SF_Structure,distance=..250] run scoreboard players set Random SF_Data 1000
#Choose a Structure
	execute if score Random SF_Data matches 0..19 at @s run function stardust:generate/structure/water_well/all
	execute if score Random SF_Data matches 20..269 at @s run function stardust:generate/structure/scruffy_house/all
	execute if score Random SF_Data matches 270..299 at @s run function stardust:generate/structure/graveyard/all
	execute if score Random SF_Data matches 300..309 at @s run function stardust:generate/structure/flying_saucer/all
	execute if score Random SF_Data matches 310..319 at @s run function stardust:generate/structure/floating_island_awakened/all
	execute if score Random SF_Data matches 320..329 at @s run function stardust:generate/structure/floating_island_enchant/all

#tellraw @a {"score":{"name":"Random","objective":"SF_Data"}}
kill @s
