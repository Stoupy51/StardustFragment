
tag @s remove stardust.fortune_module
tag @s remove stardust.silk_touch_module
data modify storage stardust:items temp set from block ~ ~ ~ Items
execute if data storage stardust:items temp[{Slot:24b,tag:{stardust:{fortune_module:1b}}}] run tag @s add stardust.fortune_module
execute if data storage stardust:items temp[{Slot:24b,tag:{stardust:{silk_touch_module:1b}}}] run tag @s add stardust.silk_touch_module
execute unless data storage stardust:items temp[{Slot:19b,tag:{stardust:{quarry_start:1b}}}] if entity @s[tag=stardust.quarry_lv6] run scoreboard players set @s stardust.quarry_status 1
execute unless data storage stardust:items temp[{Slot:19b,tag:{stardust:{quarry_start:1b}}}] if score @s energy.storage matches 625.. run scoreboard players set @s stardust.quarry_status 1
execute unless data storage stardust:items temp[{Slot:19b,tag:{stardust:{quarry_start:1b}}}] unless score @s energy.storage matches 625.. if entity @s[tag=!stardust.quarry_lv6] run tellraw @a[distance=..7] [{"text":"Not enough power","italic":false,"color":"red"}]
execute unless data storage stardust:items temp[{Slot:20b,tag:{stardust:{quarry_pause:1b}}}] if score @s stardust.quarry_status matches 2 run scoreboard players set @s stardust.quarry_status -10
execute unless data storage stardust:items temp[{Slot:20b,tag:{stardust:{quarry_pause:1b}}}] if score @s stardust.quarry_status matches -2 run scoreboard players set @s stardust.quarry_status 2
execute unless data storage stardust:items temp[{Slot:21b,tag:{stardust:{quarry_stop:1b}}}] run scoreboard players set @s stardust.quarry_status 0
scoreboard players set @s[scores={stardust.quarry_status=-10}] stardust.quarry_status -2
tag @s remove stardust.quarry_gui
