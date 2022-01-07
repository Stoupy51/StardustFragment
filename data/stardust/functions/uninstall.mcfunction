scoreboard objectives remove SF_StardustID
scoreboard objectives remove SF_Data
scoreboard objectives remove SF_X
scoreboard objectives remove SF_SCraft
scoreboard objectives remove SF_Wolfs
scoreboard objectives remove SF_Pillar
scoreboard objectives remove SF_TravelStaff
scoreboard objectives remove SF_Wormhole
scoreboard objectives remove SF_RightClick
scoreboard objectives remove SF_Jump
scoreboard objectives remove SF_Cooldown

scoreboard objectives remove SF_Qx
scoreboard objectives remove SF_Qy
scoreboard objectives remove SF_Qz
scoreboard objectives remove SF_Qx1
scoreboard objectives remove SF_Qx2
scoreboard objectives remove SF_Qy1
scoreboard objectives remove SF_Qy2
scoreboard objectives remove SF_Qz1
scoreboard objectives remove SF_Qz2
scoreboard objectives remove SF_StatQ
scoreboard objectives remove SF_SizeQ
scoreboard objectives remove SF_SpeedQ
team remove SF_Stardust
team remove SF_Red
team remove SF_Blue

data remove storage stardust:items all

tp @e[tag=SF_Destroyer] 0 -1000 0
kill @e[tag=SF_Destroyer]

clear @a #stardust:items{SF_CustomItem:1b}

datapack disable "file/Stardust Fragment [v3.2.0]"
