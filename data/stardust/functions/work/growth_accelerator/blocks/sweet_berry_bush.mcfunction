
scoreboard players set #success stardust.data 0
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ sweet_berry_bush[age=3]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ sweet_berry_bush[age=2] run setblock ~ ~ ~ sweet_berry_bush[age=3]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ sweet_berry_bush[age=1] run setblock ~ ~ ~ sweet_berry_bush[age=2]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ sweet_berry_bush[age=0] run setblock ~ ~ ~ sweet_berry_bush[age=1]
