#Define a positive value randomly with UUID.
	scoreboard players set 1000 SF_Data 500
	execute store result score Random SF_Data run seed
	execute store result score PosX SF_Data run data get entity @s Pos[0] 0.07
	execute store result score PosZ SF_Data run data get entity @s Pos[2] 0.07
	scoreboard players operation Random SF_Data *= PosX SF_Data
	scoreboard players operation Random SF_Data *= PosZ SF_Data
	scoreboard players operation Random SF_Data %= 1000 SF_Data
	execute if entity @e[type=bat,tag=SF_Structure,distance=..150] run scoreboard players set Random SF_Data 1000
#Choose a Structure
	execute if score Random SF_Data matches 0..19 run function stardust:generate/structure/water_well/all
	execute if score Random SF_Data matches 20..269 run function stardust:generate/structure/scruffy_house/all
	execute if score Random SF_Data matches 270..299 run function stardust:generate/structure/graveyard/all

#tellraw @a {"score":{"name":"Random","objective":"SF_Data"}}
kill @s
