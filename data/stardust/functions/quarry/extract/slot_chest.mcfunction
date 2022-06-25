
scoreboard players set #slot stardust.data 0

execute if score #slot stardust.data matches 0 if data storage stardust:main Hopper[{Slot:0b}] run scoreboard players set #slot stardust.data 1
execute if score #slot stardust.data matches 1 if data storage stardust:main Hopper[{Slot:1b}] run scoreboard players set #slot stardust.data 2
execute if score #slot stardust.data matches 2 if data storage stardust:main Hopper[{Slot:2b}] run scoreboard players set #slot stardust.data 3
execute if score #slot stardust.data matches 3 if data storage stardust:main Hopper[{Slot:3b}] run scoreboard players set #slot stardust.data 4
execute if score #slot stardust.data matches 4 if data storage stardust:main Hopper[{Slot:4b}] run scoreboard players set #slot stardust.data 5
execute if score #slot stardust.data matches 5 if data storage stardust:main Hopper[{Slot:5b}] run scoreboard players set #slot stardust.data 6
execute if score #slot stardust.data matches 6 if data storage stardust:main Hopper[{Slot:6b}] run scoreboard players set #slot stardust.data 7
execute if score #slot stardust.data matches 7 if data storage stardust:main Hopper[{Slot:7b}] run scoreboard players set #slot stardust.data 8
execute if score #slot stardust.data matches 8 if data storage stardust:main Hopper[{Slot:8b}] run scoreboard players set #slot stardust.data 9
execute if score #slot stardust.data matches 9 if data storage stardust:main Hopper[{Slot:9b}] run scoreboard players set #slot stardust.data 10
execute if score #slot stardust.data matches 10 if data storage stardust:main Hopper[{Slot:10b}] run scoreboard players set #slot stardust.data 11
execute if score #slot stardust.data matches 11 if data storage stardust:main Hopper[{Slot:11b}] run scoreboard players set #slot stardust.data 12
execute if score #slot stardust.data matches 12 if data storage stardust:main Hopper[{Slot:12b}] run scoreboard players set #slot stardust.data 13
execute if score #slot stardust.data matches 13 if data storage stardust:main Hopper[{Slot:13b}] run scoreboard players set #slot stardust.data 14
execute if score #slot stardust.data matches 14 if data storage stardust:main Hopper[{Slot:14b}] run scoreboard players set #slot stardust.data 15
execute if score #slot stardust.data matches 15 if data storage stardust:main Hopper[{Slot:15b}] run scoreboard players set #slot stardust.data 16
execute if score #slot stardust.data matches 16 if data storage stardust:main Hopper[{Slot:16b}] run scoreboard players set #slot stardust.data 17
execute if score #slot stardust.data matches 17 if data storage stardust:main Hopper[{Slot:17b}] run scoreboard players set #slot stardust.data 18
execute if score #slot stardust.data matches 18 if data storage stardust:main Hopper[{Slot:18b}] run scoreboard players set #slot stardust.data 19
execute if score #slot stardust.data matches 19 if data storage stardust:main Hopper[{Slot:19b}] run scoreboard players set #slot stardust.data 20
execute if score #slot stardust.data matches 20 if data storage stardust:main Hopper[{Slot:20b}] run scoreboard players set #slot stardust.data 21
execute if score #slot stardust.data matches 21 if data storage stardust:main Hopper[{Slot:21b}] run scoreboard players set #slot stardust.data 22
execute if score #slot stardust.data matches 22 if data storage stardust:main Hopper[{Slot:22b}] run scoreboard players set #slot stardust.data 23
execute if score #slot stardust.data matches 23 if data storage stardust:main Hopper[{Slot:23b}] run scoreboard players set #slot stardust.data 24
execute if score #slot stardust.data matches 24 if data storage stardust:main Hopper[{Slot:24b}] run scoreboard players set #slot stardust.data 25
execute if score #slot stardust.data matches 25 if data storage stardust:main Hopper[{Slot:25b}] run scoreboard players set #slot stardust.data 26

execute store result storage stardust:main Item.Slot byte 1 run scoreboard players get #slot stardust.data
