
execute unless score WitherKillerDisabled stardust.config matches 1 run function stardust:right_click/wither_killer/secondary

execute if score WitherKillerDisabled stardust.config matches 1 run tellraw @s {"text":"Stardust Fragment Warning: Wither Killer is disabled on this server.","color":"gold"}
execute if score WitherKillerDisabled stardust.config matches 1 run playsound entity.villager.no ambient @s
