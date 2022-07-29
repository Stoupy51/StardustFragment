
execute unless score WormholePotionDisabled stardust.config matches 1 run function stardust:right_click/wormhole_potion/secondary
execute if score WormholePotionDisabled stardust.config matches 1 run tellraw @s {"text":"Stardust Fragment Warning: Wormhole Potion is disabled on this server.","color":"gold"}
execute if score WormholePotionDisabled stardust.config matches 1 run playsound entity.villager.no ambient @s
