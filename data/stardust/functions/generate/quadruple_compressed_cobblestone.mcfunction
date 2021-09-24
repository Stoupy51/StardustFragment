#Define a -/+ value offset randomly with UUID.
#I divide values by 10 to keep a digit
#Init values
	scoreboard players set 1500 SE_Data 1500
	scoreboard players set 400 SE_Data 400
	scoreboard players set -1 SE_Data -1
	execute store result score X SE_Data run data get entity @s UUID[1] 1
	execute store result score Y SE_Data run data get entity @s UUID[2] 1
	execute store result score Z SE_Data run data get entity @s UUID[3] 1
	scoreboard players operation NewX SE_Data = X SE_Data
	scoreboard players operation NewY SE_Data = Y SE_Data
	scoreboard players operation NewZ SE_Data = Z SE_Data
	execute store result score PosX SE_Data run data get entity @s Pos[0] 10
	execute store result score PosY SE_Data run data get entity @s Pos[1] 10
	execute store result score PosZ SE_Data run data get entity @s Pos[2] 10

#Edit X Pos : X can take a value between -40 & +40   Examples : -37.4, 14.3, 0.1, ...
	scoreboard players operation NewX SE_Data %= 400 SE_Data
	execute if score X SE_Data matches ..-1 run scoreboard players operation NewX SE_Data *= -1 SE_Data
	scoreboard players operation PosX SE_Data += NewX SE_Data

#Edit Z Pos : Z can take a value between -40 & +40   Examples : -37.4, 14.3, 0.1, ...
	scoreboard players operation NewZ SE_Data %= 400 SE_Data
	execute if score Z SE_Data matches ..-1 run scoreboard players operation NewZ SE_Data *= -1 SE_Data
	scoreboard players operation PosZ SE_Data += NewZ SE_Data

#Edit Y Pos : Y can take a value between +0 & +150
	scoreboard players operation NewY SE_Data %= 1500 SE_Data
	scoreboard players operation PosY SE_Data += NewY SE_Data

#Update Position
	execute store result entity @s Pos[0] double 0.1 run scoreboard players get PosX SE_Data
	execute store result entity @s Pos[1] double 0.1 run scoreboard players get PosY SE_Data
	execute store result entity @s Pos[2] double 0.1 run scoreboard players get PosZ SE_Data

#Placing Ore
	execute at @s if block ~ ~ ~ #stardust:for_stardust_ore run summon minecraft:glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SF_Destroyer","SF_QuadrupleCompressedCobblestone"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013018}}}
	execute at @s if block ~ ~ ~ #stardust:for_stardust_ore run setblock ~ ~ ~ minecraft:cobblestone
	execute at @s positioned ~0.75 ~0.75 ~0.75 if block ~ ~ ~ #stardust:for_stardust_ore run summon minecraft:glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SF_Destroyer","SF_QuadrupleCompressedCobblestone"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013018}}}
	execute at @s positioned ~0.75 ~0.75 ~0.75 if block ~ ~ ~ #stardust:for_stardust_ore run setblock ~ ~ ~ minecraft:cobblestone
	execute at @s positioned ~ ~0.75 ~0.75 if block ~ ~ ~ #stardust:for_stardust_ore run summon minecraft:glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SF_Destroyer","SF_QuadrupleCompressedCobblestone"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013018}}}
	execute at @s positioned ~ ~0.75 ~0.75 if block ~ ~ ~ #stardust:for_stardust_ore run setblock ~ ~ ~ minecraft:cobblestone
	execute at @s positioned ~0.75 ~0.75 ~ if block ~ ~ ~ #stardust:for_stardust_ore run summon minecraft:glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SF_Destroyer","SF_QuadrupleCompressedCobblestone"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013018}}}
	execute at @s positioned ~0.75 ~0.75 ~ if block ~ ~ ~ #stardust:for_stardust_ore run setblock ~ ~ ~ minecraft:cobblestone
	execute at @s positioned ~0.75 ~ ~0.75 if block ~ ~ ~ #stardust:for_stardust_ore run summon minecraft:glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SF_Destroyer","SF_QuadrupleCompressedCobblestone"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013018}}}
	execute at @s positioned ~0.75 ~ ~0.75 if block ~ ~ ~ #stardust:for_stardust_ore run setblock ~ ~ ~ minecraft:cobblestone
	execute at @s positioned ~ ~0.75 ~ if block ~ ~ ~ #stardust:for_stardust_ore run summon minecraft:glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SF_Destroyer","SF_QuadrupleCompressedCobblestone"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"minecraft:barrel",Count:1b,tag:{CustomModelData:2013018}}}
	execute at @s positioned ~ ~0.75 ~ if block ~ ~ ~ #stardust:for_stardust_ore run setblock ~ ~ ~ minecraft:cobblestone
kill @s
