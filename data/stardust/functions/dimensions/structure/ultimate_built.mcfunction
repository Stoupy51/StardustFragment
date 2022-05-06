
execute in stardust:ultimate run setblock 23 96 -69 air replace
execute in stardust:ultimate run setblock 23 96 -21 air replace
execute in stardust:ultimate run setblock -73 96 -69 air replace
execute in stardust:ultimate run setblock -73 96 -21 air replace

execute in stardust:ultimate run setblock 23 48 -69 air replace
execute in stardust:ultimate run setblock 23 48 -21 air replace
execute in stardust:ultimate run setblock 23 48 27 air replace
execute in stardust:ultimate run setblock -73 48 -69 air replace
execute in stardust:ultimate run setblock -73 48 -21 air replace
execute in stardust:ultimate run setblock -73 48 27 air replace
execute in stardust:ultimate run setblock -25 48 -69 air replace
execute in stardust:ultimate run setblock -25 48 -21 air replace
execute in stardust:ultimate run setblock -25 48 27 air replace

execute in stardust:ultimate run setblock 23 0 -69 air replace
execute in stardust:ultimate run setblock 23 0 -21 air replace
execute in stardust:ultimate run setblock 23 0 27 air replace
execute in stardust:ultimate run setblock -73 0 -69 air replace
execute in stardust:ultimate run setblock -73 0 -21 air replace
execute in stardust:ultimate run setblock -73 0 27 air replace
execute in stardust:ultimate run setblock -25 0 -69 air replace
execute in stardust:ultimate run setblock -25 0 -21 air replace
execute in stardust:ultimate run setblock -25 0 27 air replace

execute in stardust:ultimate run fill -8 96 34 -18 103 44 air

execute in stardust:ultimate run forceload remove -73 -69 71 75
tellraw @a [{"text":"[Stardust","color":"dark_aqua"},{"text":"Fragment] ","color":"aqua"},{"text":"Ultimate Dimension has been initialized!","color":"white"}]
scoreboard players set #ultimate_built stardust.data 2

