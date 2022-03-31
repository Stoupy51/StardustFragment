scoreboard players set Quarry stardust.data 0
execute as @e[type=shulker,tag=stardust.quarryDisplayX] run function stardust:quarry/display/kill
execute as @e[type=glow_item_frame,tag=stardust.quarry] at @s run function stardust:quarry/opti
execute as @a[nbt={SelectedItem:{tag:{stardust:{quarry_configurator:1b}}}}] at @s run function stardust:quarry/display/configurator