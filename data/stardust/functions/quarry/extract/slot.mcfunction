
scoreboard players set #slot stardust.data 0

execute if score #slot stardust.data matches 0 if data storage stardust:main Hopper[{Slot:0b}] run scoreboard players set #slot stardust.data 1
execute if score #slot stardust.data matches 1 if data storage stardust:main Hopper[{Slot:1b}] run scoreboard players set #slot stardust.data 2
execute if score #slot stardust.data matches 2 if data storage stardust:main Hopper[{Slot:2b}] run scoreboard players set #slot stardust.data 3
execute if score #slot stardust.data matches 3 if data storage stardust:main Hopper[{Slot:3b}] run scoreboard players set #slot stardust.data 4

execute store result storage stardust:main Item.Slot byte 1 run scoreboard players get #slot stardust.data
