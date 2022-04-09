data modify entity @s DeathLootTable set value "stardust:entities/stoupy"

effect give @s jump_boost 99999 4 true
attribute @s generic.attack_damage modifier add 1-1-1-1-1 "1" 4 multiply_base
attribute @s generic.max_health modifier add 1-1-1-1-2 "2" 12.5 multiply_base
data modify entity @s Health set value 2048
tag @s remove stardust.stoup_army

scoreboard players operation #temp stardust.data = StoupArmyWolfCount stardust.config
execute if score #temp stardust.data matches 1.. run function stardust:boss/summon_wolf
