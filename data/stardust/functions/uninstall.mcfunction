scoreboard objectives remove StardustFragment_StardustID
scoreboard objectives remove StardustFragment_Data
scoreboard objectives remove StardustFragment_X
scoreboard objectives remove StardustFragment_SCraft
scoreboard objectives remove StardustFragment_Wolfs
scoreboard objectives remove StardustFragment_Pillar
scoreboard objectives remove StardustFragment_TravelStaff
scoreboard objectives remove StardustFragment_Wormhole
scoreboard objectives remove StardustFragment_RightClick
scoreboard objectives remove StardustFragment_Jump
scoreboard objectives remove StardustFragment_Cooldown

scoreboard objectives remove StardustFragment_Qx
scoreboard objectives remove StardustFragment_Qy
scoreboard objectives remove StardustFragment_Qz
scoreboard objectives remove StardustFragment_Qx1
scoreboard objectives remove StardustFragment_Qx2
scoreboard objectives remove StardustFragment_Qy1
scoreboard objectives remove StardustFragment_Qy2
scoreboard objectives remove StardustFragment_Qz1
scoreboard objectives remove StardustFragment_Qz2
scoreboard objectives remove StardustFragment_StatQ
scoreboard objectives remove StardustFragment_SizeQ
scoreboard objectives remove StardustFragment_SpeedQ
team remove StardustFragment_Stardust
team remove StardustFragment_Red
team remove StardustFragment_Blue

data remove storage stardust:items all

tp @e[tag=StardustFragment_Destroyer] 0 -1000 0
kill @e[tag=StardustFragment_Destroyer]

clear @a #stardust:items{StardustFragment_CustomItem:1b}

datapack disable "file/Stardust Fragment [v3.2.0]"
