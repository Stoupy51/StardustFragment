execute as @e[type=minecraft:glow_item_frame,tag=!SF_Balance,tag=!SF_Balanced,tag=SF_Destroyer,distance=..1.1] if score @s EF_kJmax = Energy SF_Data at @s run function stardust:balance/found
#Redistributes Energy
    scoreboard players set Energy SF_Data 0
    scoreboard players set Count SF_Data 0
    execute as @e[type=minecraft:glow_item_frame,tag=SF_Balance] run function stardust:balance/add
    scoreboard players operation Remain SF_Data = Energy SF_Data
    scoreboard players operation Balance SF_Data = Energy SF_Data
    scoreboard players operation Balance SF_Data /= Count SF_Data
    scoreboard players operation Remain SF_Data %= Count SF_Data
    scoreboard players operation @e[type=minecraft:glow_item_frame,tag=SF_Balance] EF_kJ = Balance SF_Data
    scoreboard players operation @s EF_kJ += Remain SF_Data
    execute if score @s EF_kJ > @s EF_kJmax run scoreboard players operation @s EF_kJ = @s EF_kJmax

#Continue
    tag @e[type=minecraft:glow_item_frame,tag=SF_Balance] remove SF_Balance
    execute if entity @s[tag=SF_StardustPhotovoltaicPanel] as @e[type=minecraft:glow_item_frame,tag=SF_StardustPhotovoltaicPanel,tag=!SF_Balanced,limit=1] at @s run function stardust:balance/all
    execute if entity @s[tag=SF_AwakenedPhotovoltaicPanel] as @e[type=minecraft:glow_item_frame,tag=SF_AwakenedPhotovoltaicPanel,tag=!SF_Balanced,limit=1] at @s run function stardust:balance/all
    execute if entity @s[tag=SF_LegendaryPhotovoltaicPanel] as @e[type=minecraft:glow_item_frame,tag=SF_LegendaryPhotovoltaicPanel,tag=!SF_Balanced,limit=1] at @s run function stardust:balance/all
    execute if entity @s[tag=SF_SolarPhotovoltaicPanel] as @e[type=minecraft:glow_item_frame,tag=SF_SolarPhotovoltaicPanel,tag=!SF_Balanced,limit=1] at @s run function stardust:balance/all
    execute if entity @s[tag=SF_DarkPhotovoltaicPanel] as @e[type=minecraft:glow_item_frame,tag=SF_DarkPhotovoltaicPanel,tag=!SF_Balanced,limit=1] at @s run function stardust:balance/all
