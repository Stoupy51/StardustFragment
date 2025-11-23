
#> stardust:advancements/right_click
#
# @executed	as the player & at current position
#
# @within	advancement stardust:technical/right_click
#

# Revoke advancement and reset score
advancement revoke @s only stardust:technical/right_click
scoreboard players set @s stardust.right_click 0

# If holding a quarry configurator, handle it
execute if items entity @s weapon.* *[custom_data~{stardust:{quarry_configurator:true}}] run function stardust:quarry/configurator/right_click

# If holding a home travel staff, handle it
execute if items entity @s weapon.mainhand *[custom_data~{stardust:{home_travel_staff:true}}] run function stardust:utils/home_travel_staff/right_click

# If holding a wormhole potion, handle it
execute if items entity @s weapon.* *[custom_data~{stardust:{wormhole_potion:true}}] run function stardust:utils/wormhole_potion/right_click

