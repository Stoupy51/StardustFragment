
scoreboard players set #count stardust.data 0
execute store result score #count stardust.data if entity @e[tag=stardust.stardust_pillar,distance=..128]
execute if score #count stardust.data matches ..9 run function stardust:right_click/stardust_pillar/secondary
execute if score #count stardust.data matches 10.. run tellraw @s {"text":"Stardust Fragment Error: You can't spawn another Stardust Pillar because there is more than 10 in a radius of 128 blocks","color":"red","italic":false}

