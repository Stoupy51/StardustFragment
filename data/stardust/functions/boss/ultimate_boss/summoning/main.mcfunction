
kill @e[type=end_crystal,predicate=stardust:in_dim/ultimate]
scoreboard players add #ultimate_summoning stardust.data 1
execute unless score #ultimate_summoning stardust.data matches 200.. run schedule function stardust:boss/ultimate_boss/summoning/main 1t
execute if score #ultimate_summoning stardust.data matches 1 in stardust:ultimate as @a[y=0] at @s run playsound entity.ender_dragon.growl ambient @s ~ ~ ~ 0.3
execute if score #ultimate_summoning stardust.data matches 90 in stardust:ultimate as @a[y=0] at @s run playsound entity.ender_dragon.growl ambient @s ~ ~ ~ 0.4
execute if score #ultimate_summoning stardust.data matches 180 in stardust:ultimate as @a[y=0] at @s run playsound entity.ender_dragon.growl ambient @s ~ ~ ~ 0.5
execute if score #ultimate_summoning stardust.data matches 200.. in stardust:ultimate positioned 0 100 0 run function stardust:boss/ultimate_boss/summoning/spawn
execute in stardust:ultimate run particle dragon_breath 0 80 0 50 10 50 0.1 1000
