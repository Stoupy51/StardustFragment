
scoreboard players set #success stardust.data 0
execute if score #success stardust.data matches 0 store success score #success stardust.data if block ~ ~ ~ cave_vines_plant[berries=false] run setblock ~ ~ ~ cave_vines_plant[berries=true]
