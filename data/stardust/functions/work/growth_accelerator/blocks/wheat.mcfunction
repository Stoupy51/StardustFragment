
scoreboard players set #success stardust.data 0
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ wheat[age=7]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ wheat[age=6] run setblock ~ ~ ~ wheat[age=7]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ wheat[age=5] run setblock ~ ~ ~ wheat[age=6]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ wheat[age=4] run setblock ~ ~ ~ wheat[age=5]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ wheat[age=3] run setblock ~ ~ ~ wheat[age=4]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ wheat[age=2] run setblock ~ ~ ~ wheat[age=3]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ wheat[age=1] run setblock ~ ~ ~ wheat[age=2]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ wheat[age=0] run setblock ~ ~ ~ wheat[age=1]
