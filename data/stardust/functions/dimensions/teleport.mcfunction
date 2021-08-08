scoreboard players remove @s SF_Data 9
playsound minecraft:block.portal.trigger ambient @s[scores={SF_Data=2}]
playsound minecraft:block.portal.trigger ambient @s[nbt={SelectedItem:{tag:{SF_TravelStaff:1b}}},scores={SF_Data=7}]
effect give @s[scores={SF_Data=1..}] minecraft:nausea 5 0 true
effect give @s[scores={SF_Data=..0}] minecraft:nausea 1 1 true
scoreboard players reset @s[scores={SF_Data=..0}] SF_Data

#TravelStaff
    execute as @s[nbt={SelectedItem:{tag:{SF_TravelStaff:1b}}},scores={SF_Data=6..}] run function stardust:dimensions/home

#Forceload to generate chunks
    execute as @s[scores={SF_Data=5}] at @s positioned ~ ~-1 ~ if entity @e[type=minecraft:glow_item_frame,tag=SF_CelestialPortal,distance=..1,dx=0] in stardust:celestial run forceload add ~-50 ~-50 ~50 ~50
    execute as @s[scores={SF_Data=5}] at @s positioned ~ ~-1 ~ if entity @e[type=minecraft:glow_item_frame,tag=SF_CavernPortal,distance=..1,dx=0] in stardust:cavern run forceload add ~-50 ~-50 ~50 ~50
    execute as @s[scores={SF_Data=5}] at @s positioned ~ ~-1 ~ if entity @e[type=minecraft:glow_item_frame,tag=SF_StardustPortal,distance=..1,dx=0] in stardust:stardust run forceload add ~-50 ~-50 ~50 ~50
    execute as @s[nbt={Dimension:"stardust:cavern"},scores={SF_Data=5}] at @s positioned ~ ~-1 ~ if entity @e[type=minecraft:glow_item_frame,tag=SF_CavernPortal,distance=..1,dx=0] in minecraft:overworld run forceload add ~-50 ~-50 ~50 ~50
    execute as @s[nbt={Dimension:"stardust:celestial"},scores={SF_Data=5}] at @s positioned ~ ~-1 ~ if entity @e[type=minecraft:glow_item_frame,tag=SF_CelestialPortal,distance=..1,dx=0] in minecraft:overworld run forceload add ~-50 ~-50 ~50 ~50
    execute as @s[nbt={Dimension:"stardust:stardust"},scores={SF_Data=5}] at @s positioned ~ ~-1 ~ if entity @e[type=minecraft:glow_item_frame,tag=SF_StardustPortal,distance=..1,dx=0] in minecraft:overworld run forceload add ~-50 ~-50 ~50 ~50

#Teleport
    execute as @s[nbt={Dimension:"stardust:cavern"},scores={SF_Data=6..}] at @s positioned ~ ~-1 ~ if entity @e[type=minecraft:glow_item_frame,tag=SF_CavernPortal,distance=..1,dx=0] in minecraft:overworld run function stardust:dimensions/transition/overworld
    execute as @s[nbt={Dimension:"stardust:celestial"},scores={SF_Data=6..}] at @s positioned ~ ~-1 ~ if entity @e[type=minecraft:glow_item_frame,tag=SF_CelestialPortal,distance=..1,dx=0] in minecraft:overworld run function stardust:dimensions/transition/overworld
    execute as @s[nbt={Dimension:"stardust:stardust"},scores={SF_Data=6..}] at @s positioned ~ ~-1 ~ if entity @e[type=minecraft:glow_item_frame,tag=SF_StardustPortal,distance=..1,dx=0] in minecraft:overworld run function stardust:dimensions/transition/overworld
    execute as @s[nbt={Dimension:"stardust:dungeon"},scores={SF_Data=6..}] at @s positioned ~ ~-1 ~ if entity @e[type=minecraft:glow_item_frame,tag=SF_DungeonPortal,distance=..1,dx=0] in minecraft:overworld run function stardust:dimensions/transition/overworld
    execute as @s[scores={SF_Data=6..}] at @s positioned ~ ~-1 ~ if entity @e[type=minecraft:glow_item_frame,tag=SF_CavernPortal,distance=..1,dx=0] run function stardust:dimensions/transition/cavern
    execute as @s[scores={SF_Data=6..}] at @s positioned ~ ~-1 ~ if entity @e[type=minecraft:glow_item_frame,tag=SF_CelestialPortal,distance=..1,dx=0] run function stardust:dimensions/transition/celestial
    execute as @s[scores={SF_Data=6..}] at @s positioned ~ ~-1 ~ if entity @e[type=minecraft:glow_item_frame,tag=SF_StardustPortal,distance=..1,dx=0] run function stardust:dimensions/transition/stardust
    execute as @s[scores={SF_Data=6..}] at @s positioned ~ ~-1 ~ if entity @e[type=minecraft:glow_item_frame,tag=SF_DungeonPortal,distance=..1,dx=0] run function stardust:dimensions/transition/dungeon
    execute as @s[scores={SF_Data=6..}] at @s positioned ~ ~-1 ~ if entity @e[type=minecraft:glow_item_frame,tag=SF_UltimatePortal,distance=..1,dx=0] run function stardust:dimensions/transition/ultimate
scoreboard players reset @s[scores={SF_Data=6..}] SF_Data
