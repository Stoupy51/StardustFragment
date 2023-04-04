
scoreboard players set Quarry stardust.data 0
execute as @e[type=shulker,tag=stardust.quarry_displaying] run function stardust:quarry/display/kill
execute as @e[tag=stardust.quarry,sort=random] at @s run function stardust:quarry/opti
execute as @a[nbt={SelectedItem:{tag:{stardust:{quarry_configurator:1b}}}}] at @s run function stardust:quarry/display/configurator

