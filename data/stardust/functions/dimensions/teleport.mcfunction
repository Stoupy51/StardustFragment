
scoreboard players remove @s stardust.data 9
playsound block.portal.trigger ambient @s[scores={stardust.data=2}]
playsound block.portal.trigger ambient @s[nbt={SelectedItem:{tag:{stardust:{travel_staff:1b}}}},scores={stardust.data=7}]
effect give @s[scores={stardust.data=1..}] minecraft:nausea 5 0 true
effect give @s[scores={stardust.data=..0}] minecraft:nausea 1 1 true
scoreboard players reset @s[scores={stardust.data=..0}] stardust.data
scoreboard players set #success_tp stardust.data 0

#TravelStaff
	execute if score #success_tp stardust.data matches 0 store result score #success_tp stardust.data if entity @s[nbt={SelectedItem:{tag:{stardust:{travel_staff:1b}}}},scores={stardust.data=6..}] run function stardust:dimensions/home

#Forceload to generate chunks
	execute at @s[scores={stardust.data=5}] align xyz positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=stardust.celestial_portal,dx=0,dy=0,dz=0] in stardust:celestial run forceload add ~-50 ~-50 ~50 ~50
	execute at @s[scores={stardust.data=5}] align xyz positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=stardust.cavern_portal,dx=0,dy=0,dz=0] in stardust:cavern run forceload add ~-50 ~-50 ~50 ~50
	execute at @s[scores={stardust.data=5}] align xyz positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=stardust.stardust_portal,dx=0,dy=0,dz=0] in stardust:stardust run forceload add ~-50 ~-50 ~50 ~50
	execute at @s[nbt={Dimension:"stardust:cavern"},scores={stardust.data=5}] align xyz positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=stardust.cavern_portal,dx=0,dy=0,dz=0] in overworld run forceload add ~-50 ~-50 ~50 ~50
	execute at @s[nbt={Dimension:"stardust:celestial"},scores={stardust.data=5}] align xyz positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=stardust.celestial_portal,dx=0,dy=0,dz=0] in overworld run forceload add ~-50 ~-50 ~50 ~50
	execute at @s[nbt={Dimension:"stardust:stardust"},scores={stardust.data=5}] align xyz positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=stardust.stardust_portal,dx=0,dy=0,dz=0] in overworld run forceload add ~-50 ~-50 ~50 ~50

#Teleport
	execute if score #success_tp stardust.data matches 0 store result score #success_tp stardust.data at @s[nbt={Dimension:"stardust:cavern"},scores={stardust.data=6..}] align xyz positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=stardust.cavern_portal,dx=0,dy=0,dz=0] in overworld run function stardust:dimensions/transition/overworld
	execute if score #success_tp stardust.data matches 0 store result score #success_tp stardust.data at @s[nbt={Dimension:"stardust:celestial"},scores={stardust.data=6..}] align xyz positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=stardust.celestial_portal,dx=0,dy=0,dz=0] in overworld run function stardust:dimensions/transition/overworld
	execute if score #success_tp stardust.data matches 0 store result score #success_tp stardust.data at @s[nbt={Dimension:"stardust:stardust"},scores={stardust.data=6..}] align xyz positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=stardust.stardust_portal,dx=0,dy=0,dz=0] in overworld run function stardust:dimensions/transition/overworld
	execute if score #success_tp stardust.data matches 0 store result score #success_tp stardust.data at @s[nbt={Dimension:"stardust:dungeon"},scores={stardust.data=6..}] align xyz positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=stardust.stardust_dungeon_portal,dx=0,dy=0,dz=0] in overworld run function stardust:dimensions/transition/overworld
	execute if score #success_tp stardust.data matches 0 store result score #success_tp stardust.data at @s[scores={stardust.data=6..}] align xyz positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=stardust.cavern_portal,dx=0,dy=0,dz=0] run function stardust:dimensions/transition/cavern
	execute if score #success_tp stardust.data matches 0 store result score #success_tp stardust.data at @s[scores={stardust.data=6..}] align xyz positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=stardust.celestial_portal,dx=0,dy=0,dz=0] run function stardust:dimensions/transition/celestial
	execute if score #success_tp stardust.data matches 0 store result score #success_tp stardust.data at @s[scores={stardust.data=6..}] align xyz positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=stardust.stardust_portal,dx=0,dy=0,dz=0] run function stardust:dimensions/transition/stardust
	execute if score #success_tp stardust.data matches 0 store result score #success_tp stardust.data at @s[scores={stardust.data=6..}] align xyz positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=stardust.stardust_dungeon_portal,dx=0,dy=0,dz=0] run function stardust:dimensions/transition/dungeon
	execute if score #success_tp stardust.data matches 0 store result score #success_tp stardust.data at @s[scores={stardust.data=6..}] align xyz positioned ~ ~-1 ~ if entity @e[type=glow_item_frame,tag=stardust.ultimate_portal,dx=0,dy=0,dz=0] run function stardust:dimensions/transition/ultimate

scoreboard players reset @s[scores={stardust.data=6..}] stardust.data
scoreboard players reset #success_tp stardust.data
