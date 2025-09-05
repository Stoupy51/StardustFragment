
#> stardust:balancing/main
#
# @executed	as @e[tag=stardust.can_balance,scores={energy.storage=20..}] & at @s[tag=!stardust.balanced]
#
# @within	stardust:v3.5.0/second_5 [ as @e[tag=stardust.can_balance,scores={energy.storage=20..}] & at @s[tag=!stardust.balanced] ]
#

# Stop if already balanced
execute if entity @s[tag=stardust.balanced] run return 0

# Copy max storage from device to scoreboard & add balance tags
scoreboard players operation #max_storage stardust.data = @s energy.max_storage

# For each balancing device, run the main function
execute if entity @s[tag=stardust.stardust_battery] run function stardust:balancing/stardust_battery/main
execute if entity @s[tag=stardust.awakened_stardust_battery] run function stardust:balancing/awakened_stardust_battery/main
execute if entity @s[tag=stardust.ultimate_battery] run function stardust:balancing/ultimate_battery/main
execute if entity @s[tag=stardust.stardust_solar_panel] run function stardust:balancing/stardust_solar_panel/main
execute if entity @s[tag=stardust.awakened_solar_panel] run function stardust:balancing/awakened_solar_panel/main
execute if entity @s[tag=stardust.legendarium_solar_panel] run function stardust:balancing/legendarium_solar_panel/main
execute if entity @s[tag=stardust.solarium_solar_panel] run function stardust:balancing/solarium_solar_panel/main
execute if entity @s[tag=stardust.darkium_solar_panel] run function stardust:balancing/darkium_solar_panel/main
execute if entity @s[tag=stardust.ultimate_solar_panel] run function stardust:balancing/ultimate_solar_panel/main

# Remove adjacent tags
tag @e[tag=stardust.adjacent] remove stardust.adjacent

