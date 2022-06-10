
execute in stardust:ultimate run fill -8 96 34 -18 103 44 air
execute in stardust:ultimate run forceload remove -73 -69 71 75
tellraw @a [{"text":"[Stardust","color":"dark_aqua"},{"text":"Fragment] ","color":"aqua"},{"text":"Ultimate Dimension has been initialized!","color":"white"}]
scoreboard players set #ultimate_built stardust.data 2
