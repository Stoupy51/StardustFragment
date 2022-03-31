
scoreboard players remove @s stardust.data 9
playsound minecraft:block.portal.trigger ambient @s[scores={stardust.data=2}]
playsound minecraft:block.portal.trigger ambient @s[nbt={SelectedItem:{tag:{stardust:{travel_staff:1b}}}},scores={stardust.data=7}]
effect give @s[scores={stardust.data=1..}] minecraft:nausea 5 0 true
effect give @s[scores={stardust.data=..0}] minecraft:nausea 1 1 true
scoreboard players reset @s[scores={stardust.data=..0}] stardust.data

#TravelStaff
	execute if entity @s[nbt={SelectedItem:{tag:{stardust:{travel_staff:1b}}}},scores={stardust.data=6..}] run function stardust:dimensions/home

#Forceload to generate chunks
	execute if entity @s[scores={stardust.data=5}] at @s positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=stardust.celestial_portal,distance=..1,dx=0,dz=0] in stardust:celestial run forceload add ~-50 ~-50 ~50 ~50
	execute if entity @s[scores={stardust.data=5}] at @s positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=stardust.cavern_portal,distance=..1,dx=0,dz=0] in stardust:cavern run forceload add ~-50 ~-50 ~50 ~50
	execute if entity @s[scores={stardust.data=5}] at @s positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=stardust.stardust_portal,distance=..1,dx=0,dz=0] in stardust:stardust run forceload add ~-50 ~-50 ~50 ~50
	execute if entity @s[nbt={Dimension:"stardust:cavern"},scores={stardust.data=5}] at @s positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=stardust.cavern_portal,distance=..1,dx=0,dz=0] in minecraft:overworld run forceload add ~-50 ~-50 ~50 ~50
	execute if entity @s[nbt={Dimension:"stardust:celestial"},scores={stardust.data=5}] at @s positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=stardust.celestial_portal,distance=..1,dx=0,dz=0] in minecraft:overworld run forceload add ~-50 ~-50 ~50 ~50
	execute if entity @s[nbt={Dimension:"stardust:stardust"},scores={stardust.data=5}] at @s positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=stardust.stardust_portal,distance=..1,dx=0,dz=0] in minecraft:overworld run forceload add ~-50 ~-50 ~50 ~50

#Teleport
	execute if entity @s[nbt={Dimension:"stardust:cavern"},scores={stardust.data=6..}] at @s positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=stardust.cavern_portal,distance=..1,dx=0,dz=0] in minecraft:overworld run function stardust:dimensions/transition/overworld
	execute if entity @s[nbt={Dimension:"stardust:celestial"},scores={stardust.data=6..}] at @s positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=stardust.celestial_portal,distance=..1,dx=0,dz=0] in minecraft:overworld run function stardust:dimensions/transition/overworld
	execute if entity @s[nbt={Dimension:"stardust:stardust"},scores={stardust.data=6..}] at @s positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=stardust.stardust_portal,distance=..1,dx=0,dz=0] in minecraft:overworld run function stardust:dimensions/transition/overworld
	execute if entity @s[nbt={Dimension:"stardust:dungeon"},scores={stardust.data=6..}] at @s positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=stardust.stardust_dungeon_portal,distance=..1,dx=0,dz=0] in minecraft:overworld run function stardust:dimensions/transition/overworld
	execute if entity @s[scores={stardust.data=6..}] at @s positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=stardust.cavern_portal,distance=..1,dx=0,dz=0] run function stardust:dimensions/transition/cavern
	execute if entity @s[scores={stardust.data=6..}] at @s positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=stardust.celestial_portal,distance=..1,dx=0,dz=0] run function stardust:dimensions/transition/celestial
	execute if entity @s[scores={stardust.data=6..}] at @s positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=stardust.stardust_portal,distance=..1,dx=0,dz=0] run function stardust:dimensions/transition/stardust
	execute if entity @s[scores={stardust.data=6..}] at @s positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=stardust.stardust_dungeon_portal,distance=..1,dx=0,dz=0] run function stardust:dimensions/transition/dungeon
	execute if entity @s[scores={stardust.data=6..}] at @s positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=stardust.ultimate_portal,distance=..1,dx=0,dz=0] run function stardust:dimensions/transition/ultimate
scoreboard players reset @s[scores={stardust.data=6..}] stardust.data
