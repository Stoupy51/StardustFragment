
execute unless score TravelStaffDisabled stardust.config matches 1 unless score @s stardust.data matches 1.. run scoreboard players add @s stardust.data 1
execute if score TravelStaffDisabled stardust.config matches 1 run tellraw @s {"text":"Stardust Fragment Warning: Travel Staff is disabled on this server.","color":"gold"}
execute if score TravelStaffDisabled stardust.config matches 1 run playsound entity.villager.no ambient @s
