
#> stardust:calls/energy/cable_can_connect
#
# @within	#energy:v1/cable_can_connect
#

execute if entity @s[tag=stardust.stardust_solar_panel] if score #cable.in energy.data matches 1 run scoreboard players set #cable.out energy.data 0
execute if entity @s[tag=stardust.awakened_stardust_solar_panel] if score #cable.in energy.data matches 1 run scoreboard players set #cable.out energy.data 0
execute if entity @s[tag=stardust.legendarium_solar_panel] if score #cable.in energy.data matches 1 run scoreboard players set #cable.out energy.data 0
execute if entity @s[tag=stardust.solarium_solar_panel] if score #cable.in energy.data matches 1 run scoreboard players set #cable.out energy.data 0
execute if entity @s[tag=stardust.darkium_solar_panel] if score #cable.in energy.data matches 1 run scoreboard players set #cable.out energy.data 0
execute if entity @s[tag=stardust.ultimate_solar_panel] if score #cable.in energy.data matches 1 run scoreboard players set #cable.out energy.data 0

