tag @s remove SF_FortuneModule
tag @s remove SF_SilkTouchModule
data modify storage stardust:items Temp set from block ~ ~ ~ Items
execute if data storage stardust:items Temp[{Slot:24b,tag:{SF_FortuneModule:1b}}] run tag @s add SF_FortuneModule
execute if data storage stardust:items Temp[{Slot:24b,tag:{SF_SilkTouchModule:1b}}] run tag @s add SF_SilkTouchModule
execute unless data storage stardust:items Temp[{Slot:19b,tag:{SF_QuarryStart:1b}}] if entity @s[tag=SF_QuarryLv6] run scoreboard players set @s SF_StatQ 1
execute unless data storage stardust:items Temp[{Slot:19b,tag:{SF_QuarryStart:1b}}] if score @s energy.storage matches 625.. run scoreboard players set @s SF_StatQ 1
execute unless data storage stardust:items Temp[{Slot:19b,tag:{SF_QuarryStart:1b}}] unless score @s energy.storage matches 625.. if entity @s[tag=!SF_QuarryLv6] run tellraw @a[distance=..7] [{"text":"Not enough energy","italic":false,"color":"red"}]
execute unless data storage stardust:items Temp[{Slot:20b,tag:{SF_QuarryPause:1b}}] if score @s SF_StatQ matches 2 run scoreboard players set @s SF_StatQ -10
execute unless data storage stardust:items Temp[{Slot:20b,tag:{SF_QuarryPause:1b}}] if score @s SF_StatQ matches -2 run scoreboard players set @s SF_StatQ 2
execute unless data storage stardust:items Temp[{Slot:21b,tag:{SF_QuarryStop:1b}}] run scoreboard players set @s SF_StatQ 0
scoreboard players set @s[scores={SF_StatQ=-10}] SF_StatQ -2
tag @s remove SF_QuarryGui
