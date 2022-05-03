
scoreboard players set #success stardust.data 0
execute store success score #success stardust.data unless block ~ ~ ~ moss_carpet run function stardust:destroy/seeds/all
execute if score #success stardust.data matches 0 if entity @s[tag=stardust.diamond_seeds] unless block ~ ~-1 ~ stone run function stardust:destroy/seeds/all
execute if score #success stardust.data matches 0 if entity @s[tag=stardust.stardust_seeds] unless block ~ ~-1 ~ diamond_block run function stardust:destroy/seeds/all
execute if score #success stardust.data matches 0 if entity @s[tag=stardust.legendarium_seed] unless block ~ ~-1 ~ lime_concrete run function stardust:destroy/seeds/all
execute if score #success stardust.data matches 0 if entity @s[tag=stardust.solarium_seed] unless block ~ ~-1 ~ magma_block run function stardust:destroy/seeds/all
execute if score #success stardust.data matches 0 if entity @s[tag=stardust.darkium_seed] unless block ~ ~-1 ~ obsidian run function stardust:destroy/seeds/all
