
scoreboard players set #block stardust.data 1
scoreboard players set #success stardust.data 0
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ potatoes[age=7]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ potatoes[age=6] run setblock ~ ~ ~ potatoes[age=7]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ potatoes[age=5] run setblock ~ ~ ~ potatoes[age=6]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ potatoes[age=4] run setblock ~ ~ ~ potatoes[age=5]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ potatoes[age=3] run setblock ~ ~ ~ potatoes[age=4]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ potatoes[age=2] run setblock ~ ~ ~ potatoes[age=3]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ potatoes[age=1] run setblock ~ ~ ~ potatoes[age=2]
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ potatoes[age=0] run setblock ~ ~ ~ potatoes[age=1]
