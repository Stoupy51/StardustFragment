#Init values
	execute store result score X SimplEnergy_Data run data get entity @s UUID[1]
	execute store result score Z SimplEnergy_Data run data get entity @s UUID[3]
	scoreboard players operation NewX SimplEnergy_Data = X SimplEnergy_Data
	scoreboard players operation NewZ SimplEnergy_Data = Z SimplEnergy_Data
	execute store result score PosX SimplEnergy_Data run data get entity @s Pos[0]
	execute store result score PosZ SimplEnergy_Data run data get entity @s Pos[2]

#Edit X Pos : X can take a value between -40 & +40   Examples : -37.4, 14.3, 1, ...
	scoreboard players operation NewX SimplEnergy_Data %= 400 SimplEnergy_Data
	execute if score X SimplEnergy_Data matches ..-1 run scoreboard players operation NewX SimplEnergy_Data *= -1 SimplEnergy_Data
	scoreboard players operation PosX SimplEnergy_Data += NewX SimplEnergy_Data

#Edit Z Pos : Z can take a value between -40 & +40   Examples : -37.4, 14.3, 1, ...
	scoreboard players operation NewZ SimplEnergy_Data %= 400 SimplEnergy_Data
	execute if score Z SimplEnergy_Data matches ..-1 run scoreboard players operation NewZ SimplEnergy_Data *= -1 SimplEnergy_Data
	scoreboard players operation PosZ SimplEnergy_Data += NewZ SimplEnergy_Data

#Update Position
	execute store result entity @s Pos[0] double 1 run scoreboard players get PosX SimplEnergy_Data
	execute store result entity @s Pos[2] double 1 run scoreboard players get PosZ SimplEnergy_Data
