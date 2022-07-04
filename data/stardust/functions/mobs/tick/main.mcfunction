
scoreboard players set #death stardust.data 0
execute store success score #death stardust.data if entity @s[tag=stardust.death_model]
execute if score #death stardust.data matches 0 run function stardust:mobs/tick/secondary
execute if score #death stardust.data matches 1 run function stardust:mobs/tick/death/main
