#Define a -/+ value offset randomly with UUID.
#I divide values by 10 to keep a digit
#Init values
	execute store result score X SimplEnergy_Data run data get entity @s UUID[1] 1
	execute store result score Y SimplEnergy_Data run data get entity @s UUID[2] 1
	execute store result score Z SimplEnergy_Data run data get entity @s UUID[3] 1
	scoreboard players operation NewX SimplEnergy_Data = X SimplEnergy_Data
	scoreboard players operation NewY SimplEnergy_Data = Y SimplEnergy_Data
	scoreboard players operation NewZ SimplEnergy_Data = Z SimplEnergy_Data
	execute store result score PosX SimplEnergy_Data run data get entity @s Pos[0] 10
	execute store result score PosY SimplEnergy_Data run data get entity @s Pos[1] 10
	execute store result score PosZ SimplEnergy_Data run data get entity @s Pos[2] 10

#Edit X Pos : X can take a value between -40 & +40   Examples : -37.4, 14.3, 0.1, ...
	scoreboard players operation NewX SimplEnergy_Data %= 400 SimplEnergy_Data
	execute if score X SimplEnergy_Data matches ..-1 run scoreboard players operation NewX SimplEnergy_Data *= -1 SimplEnergy_Data
	scoreboard players operation PosX SimplEnergy_Data += NewX SimplEnergy_Data

#Edit Z Pos : Z can take a value between -40 & +40   Examples : -37.4, 14.3, 0.1, ...
	scoreboard players operation NewZ SimplEnergy_Data %= 400 SimplEnergy_Data
	execute if score Z SimplEnergy_Data matches ..-1 run scoreboard players operation NewZ SimplEnergy_Data *= -1 SimplEnergy_Data
	scoreboard players operation PosZ SimplEnergy_Data += NewZ SimplEnergy_Data

#Edit Y Pos : Y can take a value between +0 & +150
	scoreboard players operation NewY SimplEnergy_Data %= 1500 SimplEnergy_Data
	scoreboard players operation PosY SimplEnergy_Data += NewY SimplEnergy_Data

#Update Position
	execute store result entity @s Pos[0] double 0.1 run scoreboard players get PosX SimplEnergy_Data
	execute store result entity @s Pos[1] double 0.1 run scoreboard players get PosY SimplEnergy_Data
	execute store result entity @s Pos[2] double 0.1 run scoreboard players get PosZ SimplEnergy_Data

#Placing Ore
	execute at @s if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/iron_type
	execute at @s positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/iron_type
	execute at @s positioned ~ ~0.5 ~0.5 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/iron_type
	execute at @s positioned ~0.5 ~0.5 ~ if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/iron_type
	execute at @s positioned ~0.5 ~ ~0.5 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/iron_type
	execute at @s positioned ~ ~0.5 ~ if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/iron_type
	execute at @s positioned ~1 ~1 ~1 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/iron_type
	execute at @s positioned ~ ~1 ~1 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/iron_type
	execute at @s positioned ~1 ~1 ~ if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/iron_type
	execute at @s positioned ~1 ~ ~1 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/iron_type
	execute at @s positioned ~ ~1 ~ if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/iron_type
	execute at @s positioned ~1.5 ~1.5 ~1.5 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/iron_type
	execute at @s positioned ~ ~1.5 ~1.5 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/iron_type
	execute at @s positioned ~1.5 ~1.5 ~ if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/iron_type
	execute at @s positioned ~1.5 ~ ~1.5 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/iron_type
	execute at @s positioned ~ ~1.5 ~ if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/iron_type
	execute at @s positioned ~2 ~2 ~2 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/iron_type
	execute at @s positioned ~ ~2 ~2 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/iron_type
	execute at @s positioned ~2 ~2 ~ if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/iron_type
	execute at @s positioned ~2 ~ ~2 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/iron_type
	execute at @s positioned ~ ~2 ~ if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/iron_type
	execute at @s positioned ~2.5 ~2.5 ~2.5 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/iron_type
	execute at @s positioned ~ ~2.5 ~2.5 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/iron_type
	execute at @s positioned ~2.5 ~2.5 ~ if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/iron_type
	execute at @s positioned ~2.5 ~ ~2.5 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/iron_type
	execute at @s positioned ~ ~2.5 ~ if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/iron_type
	execute at @s positioned ~3 ~3 ~3 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/iron_type
	execute at @s positioned ~ ~3 ~3 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/iron_type
	execute at @s positioned ~3 ~3 ~ if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/iron_type
	execute at @s positioned ~3 ~ ~3 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/iron_type
	execute at @s positioned ~ ~3 ~ if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:generate/iron_type
kill @s
