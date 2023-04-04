
#> stardust:tick_minute
#
# @within			stardust:tick_second_5
# @executed			default context
#
# @description		Function executed every minute
#

# Timer
scoreboard players set #minute stardust.data 1

# Update optimisation score : number of Stardust Pillars
execute store result score #stardust_pillar stardust.data if entity @e[type=wither,tag=stardust.stardust_pillar]

# Cobblestone Miner working loop
execute as @e[tag=stardust.cobblestone_miner,predicate=stardust:check_cobblestone] at @s align xyz positioned ~ ~-1 ~ run function stardust:work/cobblestone_miner

# Dog Excrements
execute as @e[type=wolf,tag=!stardust.dont_shit] run scoreboard players add @e[type=wolf,limit=1,sort=random,tag=!stardust.dont_shit] stardust.wolfs 1
execute at @e[type=wolf,tag=!stardust.dont_shit,scores={stardust.wolfs=10..}] run loot spawn ~ ~ ~ loot stardust:i/dog_excrement
scoreboard players remove @e[type=wolf,scores={stardust.wolfs=10..}] stardust.wolfs 10

# Seeds
execute as @e[tag=stardust.seed,tag=!stardust.seed_done] at @s run function stardust:utils/seeds

