scoreboard players set Quarry SF_Data 0
execute as @e[type=shulker,tag=SF_QuarryDisplayX] run function stardust:quarry/display/kill
execute as @e[type=glow_item_frame,tag=SF_Quarry] at @s run function stardust:quarry/opti
execute as @a[nbt={SelectedItem:{tag:{SF_QuarryConfigurator:1s}}}] at @s run function stardust:quarry/display/configurator