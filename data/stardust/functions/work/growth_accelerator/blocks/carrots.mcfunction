
scoreboard players set #success stardust.data 0
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ carrots[age=7]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ carrots[age=6] run setblock ~ ~ ~ carrots[age=7]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ carrots[age=5] run setblock ~ ~ ~ carrots[age=6]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ carrots[age=4] run setblock ~ ~ ~ carrots[age=5]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ carrots[age=3] run setblock ~ ~ ~ carrots[age=4]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ carrots[age=2] run setblock ~ ~ ~ carrots[age=3]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ carrots[age=1] run setblock ~ ~ ~ carrots[age=2]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ carrots[age=0] run setblock ~ ~ ~ carrots[age=1]
