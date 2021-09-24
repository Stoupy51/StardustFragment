#Define a positive value randomly with UUID.
	scoreboard players set 1000 SF_Data 1000
	execute store result score Random SF_Data run seed
	execute store result score PosX SF_Data run data get entity @s Pos[0] 0.7
	execute store result score PosZ SF_Data run data get entity @s Pos[2] 0.7
	scoreboard players operation Random SF_Data += PosX SF_Data
	scoreboard players operation Random SF_Data += PosZ SF_Data
	scoreboard players operation Random SF_Data %= 1000 SF_Data

#Choose a Structure
	execute if score Random SF_Data matches 0..20 run function stardust:generate/structure/water_well/all
	execute if score Random SF_Data matches 20..270 run function stardust:generate/structure/scruffy_house/all

#tellraw @a {"score":{"name":"Random","objective":"SF_Data"}}
kill @s
