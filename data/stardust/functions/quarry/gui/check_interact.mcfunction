execute unless data block ~ ~ ~ Items[{Slot:19b,tag:{SF_QuarryStart:1b}}] if score @s EF_Joule >= @s EF_Watt run scoreboard players set @s SF_StatQ 1
execute unless data block ~ ~ ~ Items[{Slot:19b,tag:{SF_QuarryStart:1b}}] unless score @s EF_Joule >= @s EF_Watt run tellraw @a[distance=..7] [{"text":"Not enough energy","color":"red"}]
execute unless data block ~ ~ ~ Items[{Slot:20b,tag:{SF_QuarryPause:1b}}] if score @s SF_StatQ matches 2 run scoreboard players set @s SF_StatQ -10
execute unless data block ~ ~ ~ Items[{Slot:20b,tag:{SF_QuarryPause:1b}}] if score @s SF_StatQ matches -2 run scoreboard players set @s SF_StatQ 2
execute unless data block ~ ~ ~ Items[{Slot:21b,tag:{SF_QuarryStop:1b}}] run scoreboard players set @s SF_StatQ 0
scoreboard players set @s[scores={SF_StatQ=-10}] SF_StatQ -2
