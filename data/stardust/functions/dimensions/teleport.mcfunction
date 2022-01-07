scoreboard players remove @s StardustFragment_Data 9
playsound minecraft:block.portal.trigger ambient @s[scores={StardustFragment_Data=2}]
playsound minecraft:block.portal.trigger ambient @s[nbt={SelectedItem:{tag:{StardustFragment_TravelStaff:1b}}},scores={StardustFragment_Data=7}]
effect give @s[scores={StardustFragment_Data=1..}] minecraft:nausea 5 0 true
effect give @s[scores={StardustFragment_Data=..0}] minecraft:nausea 1 1 true
scoreboard players reset @s[scores={StardustFragment_Data=..0}] StardustFragment_Data

#TravelStaff
	execute as @s[nbt={SelectedItem:{tag:{StardustFragment_TravelStaff:1b}}},scores={StardustFragment_Data=6..}] run function stardust:dimensions/home

#Forceload to generate chunks
	execute as @s[scores={StardustFragment_Data=5}] at @s positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=StardustFragment_CelestialPortal,distance=..1,dx=0,dz=0] in stardust:celestial run forceload add ~-50 ~-50 ~50 ~50
	execute as @s[scores={StardustFragment_Data=5}] at @s positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=StardustFragment_CavernPortal,distance=..1,dx=0,dz=0] in stardust:cavern run forceload add ~-50 ~-50 ~50 ~50
	execute as @s[scores={StardustFragment_Data=5}] at @s positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=StardustFragment_StardustPortal,distance=..1,dx=0,dz=0] in stardust:stardust run forceload add ~-50 ~-50 ~50 ~50
	execute as @s[nbt={Dimension:"stardust:cavern"},scores={StardustFragment_Data=5}] at @s positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=StardustFragment_CavernPortal,distance=..1,dx=0,dz=0] in minecraft:overworld run forceload add ~-50 ~-50 ~50 ~50
	execute as @s[nbt={Dimension:"stardust:celestial"},scores={StardustFragment_Data=5}] at @s positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=StardustFragment_CelestialPortal,distance=..1,dx=0,dz=0] in minecraft:overworld run forceload add ~-50 ~-50 ~50 ~50
	execute as @s[nbt={Dimension:"stardust:stardust"},scores={StardustFragment_Data=5}] at @s positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=StardustFragment_StardustPortal,distance=..1,dx=0,dz=0] in minecraft:overworld run forceload add ~-50 ~-50 ~50 ~50

#Teleport
	execute as @s[nbt={Dimension:"stardust:cavern"},scores={StardustFragment_Data=6..}] at @s positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=StardustFragment_CavernPortal,distance=..1,dx=0,dz=0] in minecraft:overworld run function stardust:dimensions/transition/overworld
	execute as @s[nbt={Dimension:"stardust:celestial"},scores={StardustFragment_Data=6..}] at @s positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=StardustFragment_CelestialPortal,distance=..1,dx=0,dz=0] in minecraft:overworld run function stardust:dimensions/transition/overworld
	execute as @s[nbt={Dimension:"stardust:stardust"},scores={StardustFragment_Data=6..}] at @s positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=StardustFragment_StardustPortal,distance=..1,dx=0,dz=0] in minecraft:overworld run function stardust:dimensions/transition/overworld
	execute as @s[nbt={Dimension:"stardust:dungeon"},scores={StardustFragment_Data=6..}] at @s positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=StardustFragment_DungeonPortal,distance=..1,dx=0,dz=0] in minecraft:overworld run function stardust:dimensions/transition/overworld
	execute as @s[scores={StardustFragment_Data=6..}] at @s positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=StardustFragment_CavernPortal,distance=..1,dx=0,dz=0] run function stardust:dimensions/transition/cavern
	execute as @s[scores={StardustFragment_Data=6..}] at @s positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=StardustFragment_CelestialPortal,distance=..1,dx=0,dz=0] run function stardust:dimensions/transition/celestial
	execute as @s[scores={StardustFragment_Data=6..}] at @s positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=StardustFragment_StardustPortal,distance=..1,dx=0,dz=0] run function stardust:dimensions/transition/stardust
	execute as @s[scores={StardustFragment_Data=6..}] at @s positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=StardustFragment_DungeonPortal,distance=..1,dx=0,dz=0] run function stardust:dimensions/transition/dungeon
	execute as @s[scores={StardustFragment_Data=6..}] at @s positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=StardustFragment_UltimatePortal,distance=..1,dx=0,dz=0] run function stardust:dimensions/transition/ultimate
scoreboard players reset @s[scores={StardustFragment_Data=6..}] StardustFragment_Data
