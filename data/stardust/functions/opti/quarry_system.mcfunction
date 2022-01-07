scoreboard players set Quarry StardustFragment_Data 0
execute as @e[type=shulker,tag=StardustFragment_QuarryDisplayX] run function stardust:quarry/display/kill
execute as @e[type=glow_item_frame,tag=StardustFragment_Quarry] at @s run function stardust:quarry/opti
execute as @a[nbt={SelectedItem:{tag:{StardustFragment_QuarryConfigurator:1b}}}] at @s run function stardust:quarry/display/configurator