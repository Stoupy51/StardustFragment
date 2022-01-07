tag @s remove StardustFragment_FortuneModule
tag @s remove StardustFragment_SilkTouchModule
data modify storage stardust:items all.Temp set from block ~ ~ ~ Items
execute if data storage stardust:items all.Temp[{Slot:24b,tag:{StardustFragment_FortuneModule:1b}}] run tag @s add StardustFragment_FortuneModule
execute if data storage stardust:items all.Temp[{Slot:24b,tag:{StardustFragment_SilkTouchModule:1b}}] run tag @s add StardustFragment_SilkTouchModule
execute unless data storage stardust:items all.Temp[{Slot:19b,tag:{StardustFragment_QuarryStart:1b}}] if entity @s[tag=StardustFragment_QuarryLv6] run scoreboard players set @s StardustFragment_StatQ 1
execute unless data storage stardust:items all.Temp[{Slot:19b,tag:{StardustFragment_QuarryStart:1b}}] if score @s energy.storage matches 625.. run scoreboard players set @s StardustFragment_StatQ 1
execute unless data storage stardust:items all.Temp[{Slot:19b,tag:{StardustFragment_QuarryStart:1b}}] unless score @s energy.storage matches 625.. if entity @s[tag=!StardustFragment_QuarryLv6] run tellraw @a[distance=..7] [{"text":"Not enough energy","italic":false,"color":"red"}]
execute unless data storage stardust:items all.Temp[{Slot:20b,tag:{StardustFragment_QuarryPause:1b}}] if score @s StardustFragment_StatQ matches 2 run scoreboard players set @s StardustFragment_StatQ -10
execute unless data storage stardust:items all.Temp[{Slot:20b,tag:{StardustFragment_QuarryPause:1b}}] if score @s StardustFragment_StatQ matches -2 run scoreboard players set @s StardustFragment_StatQ 2
execute unless data storage stardust:items all.Temp[{Slot:21b,tag:{StardustFragment_QuarryStop:1b}}] run scoreboard players set @s StardustFragment_StatQ 0
scoreboard players set @s[scores={StardustFragment_StatQ=-10}] StardustFragment_StatQ -2
tag @s remove StardustFragment_QuarryGui
