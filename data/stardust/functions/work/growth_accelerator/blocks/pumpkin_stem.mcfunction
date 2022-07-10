
scoreboard players set #success stardust.data 0
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ pumpkin_stem[age=7]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ pumpkin_stem[age=6] run setblock ~ ~ ~ pumpkin_stem[age=7]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ pumpkin_stem[age=5] run setblock ~ ~ ~ pumpkin_stem[age=6]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ pumpkin_stem[age=4] run setblock ~ ~ ~ pumpkin_stem[age=5]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ pumpkin_stem[age=3] run setblock ~ ~ ~ pumpkin_stem[age=4]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ pumpkin_stem[age=2] run setblock ~ ~ ~ pumpkin_stem[age=3]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ pumpkin_stem[age=1] run setblock ~ ~ ~ pumpkin_stem[age=2]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ pumpkin_stem[age=0] run setblock ~ ~ ~ pumpkin_stem[age=1]
