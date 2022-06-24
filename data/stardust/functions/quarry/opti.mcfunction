
scoreboard players add Quarry stardust.data 1
#Select Zone
	execute if entity @p[distance=..3] run function stardust:quarry/select
#Display
	execute if entity @p[distance=..3] run function stardust:quarry/display/all
execute if score @s stardust.quarry_status matches 1.. if entity @s[tag=stardust.quarry_lv6] unless data block ~ ~ ~ Items[26] run function stardust:quarry/working
execute if score @s stardust.quarry_status matches 1.. if score @s energy.storage matches 625.. unless data block ~ ~ ~ Items[26] run function stardust:quarry/working
forceload add ~-3 ~-3 ~3 ~3
function stardust:quarry/extract/main

