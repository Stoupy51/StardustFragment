
#Launch a signal for data packs that want their seed to be compatible.
function #stardust:signals/growth_accelerator

#Vanilla seeds
scoreboard players set #count_y stardust.data 20
execute positioned ~10 ~10 ~10 run function stardust:work/growth_accelerator/layer_y

scoreboard players reset #count_x
scoreboard players reset #count_y
scoreboard players reset #count_z

playsound block.beacon.activate block @a[distance=..50]
scoreboard players reset @s stardust.data_2
