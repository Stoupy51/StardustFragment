
# Place custom ore if some have been generated
execute if score #generated_ore stardust.data matches 1 as @e[tag=stardust.new_stardust_ore] at @s run function stardust:place/stardust_ore/secondary
execute if score #generated_ore stardust.data matches 1 as @e[tag=stardust.new_deepslate_stardust_ore] at @s run function stardust:place/deepslate_stardust_ore/secondary
execute if score #generated_ore stardust.data matches 1 as @e[tag=stardust.new_nether_stardust_ore] at @s run function stardust:place/nether_stardust_ore/secondary
execute if score #generated_ore stardust.data matches 1 as @e[tag=stardust.new_ender_stardust_ore] at @s run function stardust:place/ender_stardust_ore/secondary
execute if score #generated_ore stardust.data matches 1 as @e[tag=stardust.new_awakened_stardust_ore] at @s run function stardust:place/awakened_stardust_ore/secondary
execute if score #generated_ore stardust.data matches 1 run scoreboard players reset #generated_ore stardust.data

