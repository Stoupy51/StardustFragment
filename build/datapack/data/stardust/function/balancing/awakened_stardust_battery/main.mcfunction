
#> stardust:balancing/awakened_stardust_battery/main
#
# @executed	as @e[tag=stardust.can_balance,scores={energy.storage=20..}] & at @s[tag=!stardust.balanced]
#
# @within	stardust:balancing/main
#

# Collect energy from nearby blocks recursively
scoreboard players set #count stardust.data 0
scoreboard players set #total_energy stardust.data 0
function stardust:balancing/awakened_stardust_battery/found

# If there are no adjacent device or the sum is higher than integer limit, stop here
execute if score #count stardust.data matches 1 run return 0
execute if score #total_energy stardust.data matches ..0 run return 0

# Redistributes energy to all adjacent devices
scoreboard players operation #per_device stardust.data = #total_energy stardust.data
scoreboard players operation #per_device stardust.data /= #count stardust.data
scoreboard players operation @e[tag=stardust.adjacent] energy.storage = #per_device stardust.data

# Add the remaining energy to the current device
scoreboard players operation #remaining stardust.data = #total_energy stardust.data
scoreboard players operation #remaining stardust.data %= #count stardust.data
scoreboard players operation @s energy.storage += #remaining stardust.data

# Sometimes the remaining energy is too high, so we set it to the max storage resulting in a loss of energy (lets assume it's a feature: energy transformed in heat)
execute if score @s energy.storage > @s energy.max_storage run scoreboard players operation @s energy.storage = @s energy.max_storage

