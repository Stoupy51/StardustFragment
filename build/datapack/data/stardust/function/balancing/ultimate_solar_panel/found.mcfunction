
#> stardust:balancing/ultimate_solar_panel/found
#
# @executed	as @e[tag=...,dx=0,dy=0,dz=0] & at @s
#
# @within	stardust:balancing/ultimate_solar_panel/found [ as @e[tag=...,dx=0,dy=0,dz=0] & at @s ]
#			stardust:balancing/ultimate_solar_panel/main
#

# Add tags and scores
tag @s add stardust.adjacent
tag @s add stardust.balanced
scoreboard players add #count stardust.data 1
scoreboard players operation #total_energy stardust.data += @s energy.storage

# Check nearby ultimate_solar_panel recursively
execute align xyz positioned ~ ~1 ~ as @e[tag=stardust.ultimate_solar_panel,tag=stardust.can_balance,tag=!stardust.adjacent,dx=0,dy=0,dz=0] if score @s energy.max_storage = #max_storage stardust.data at @s run function stardust:balancing/ultimate_solar_panel/found
execute align xyz positioned ~ ~-1 ~ as @e[tag=stardust.ultimate_solar_panel,tag=stardust.can_balance,tag=!stardust.adjacent,dx=0,dy=0,dz=0] if score @s energy.max_storage = #max_storage stardust.data at @s run function stardust:balancing/ultimate_solar_panel/found
execute align xyz positioned ~ ~ ~1 as @e[tag=stardust.ultimate_solar_panel,tag=stardust.can_balance,tag=!stardust.adjacent,dx=0,dy=0,dz=0] if score @s energy.max_storage = #max_storage stardust.data at @s run function stardust:balancing/ultimate_solar_panel/found
execute align xyz positioned ~ ~ ~-1 as @e[tag=stardust.ultimate_solar_panel,tag=stardust.can_balance,tag=!stardust.adjacent,dx=0,dy=0,dz=0] if score @s energy.max_storage = #max_storage stardust.data at @s run function stardust:balancing/ultimate_solar_panel/found
execute align xyz positioned ~1 ~ ~ as @e[tag=stardust.ultimate_solar_panel,tag=stardust.can_balance,tag=!stardust.adjacent,dx=0,dy=0,dz=0] if score @s energy.max_storage = #max_storage stardust.data at @s run function stardust:balancing/ultimate_solar_panel/found
execute align xyz positioned ~-1 ~ ~ as @e[tag=stardust.ultimate_solar_panel,tag=stardust.can_balance,tag=!stardust.adjacent,dx=0,dy=0,dz=0] if score @s energy.max_storage = #max_storage stardust.data at @s run function stardust:balancing/ultimate_solar_panel/found

