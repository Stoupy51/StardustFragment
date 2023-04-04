
#> stardust:tick_second_5
#
# @within			stardust:tick
# @executed			default context
#
# @description		Function executed every 5 seconds
#

# Timer
scoreboard players set #second_5 stardust.data -10
scoreboard players add #minute stardust.data 1
execute if score #minute stardust.data matches 13.. run function stardust:tick_minute

# Check custom blocks if they are still there
execute as @e[tag=stardust.destroyer] at @s run function stardust:destroy/all

# Entities : Stardust bat fires lightning bolts at players & Hopper minecart unlocking when no quarry is nearby
execute at @e[tag=stardust.stardust_bat] at @a[distance=5..12,tag=!stardust.no_bolt,gamemode=!spectator,gamemode=!creative] run summon lightning_bolt
execute as @e[tag=stardust.hopper_minecart] at @s unless entity @e[tag=stardust.quarry,distance=..3] run function stardust:quarry/extract/hopper_minecart/release

# Update optimisation score : number of players in the stardust dimension
execute store result score #in_stardust_dimension stardust.data if entity @a[predicate=stardust:in_dim/stardust]

