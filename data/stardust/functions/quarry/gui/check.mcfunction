tag @s remove SF_FortuneModule
tag @s remove SF_SilkTouchModule
execute if data block ~ ~ ~ Items[{Slot:24b,tag:{SF_FortuneModule:1s}}] run tag @s add SF_FortuneModule
execute if data block ~ ~ ~ Items[{Slot:24b,tag:{SF_SilkTouchModule:1s}}] run tag @s add SF_SilkTouchModule
execute unless data block ~ ~ ~ Items[{Slot:19b,tag:{SF_QuarryStart:1s}}] if score @s EF_kJ >= @s EF_kW run scoreboard players set @s SF_StatQ 1
execute unless data block ~ ~ ~ Items[{Slot:19b,tag:{SF_QuarryStart:1s}}] unless score @s EF_kJ >= @s EF_kW run tellraw @a[distance=..7] [{"text":"Not enough energy","italic":false,"color":"red"}]
execute unless data block ~ ~ ~ Items[{Slot:20b,tag:{SF_QuarryPause:1s}}] if score @s SF_StatQ matches 2 run scoreboard players set @s SF_StatQ -10
execute unless data block ~ ~ ~ Items[{Slot:20b,tag:{SF_QuarryPause:1s}}] if score @s SF_StatQ matches -2 run scoreboard players set @s SF_StatQ 2
execute unless data block ~ ~ ~ Items[{Slot:21b,tag:{SF_QuarryStop:1s}}] run scoreboard players set @s SF_StatQ 0
scoreboard players set @s[scores={SF_StatQ=-10}] SF_StatQ -2
tag @s remove SF_QuarryGui
