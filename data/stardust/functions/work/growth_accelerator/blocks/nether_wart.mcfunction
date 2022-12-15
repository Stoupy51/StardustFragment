
scoreboard players set #block stardust.data 1
scoreboard players set #success stardust.data 0
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ nether_wart[age=3]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ nether_wart[age=2] run setblock ~ ~ ~ nether_wart[age=3]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ nether_wart[age=1] run setblock ~ ~ ~ nether_wart[age=2]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ nether_wart[age=0] run setblock ~ ~ ~ nether_wart[age=1]
