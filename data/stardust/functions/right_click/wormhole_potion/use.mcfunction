
execute if score WormholePotionDisabled stardust.config matches 1 run playsound entity.villager.no ambient @s
execute if score WormholePotionDisabled stardust.config matches 1 run tellraw @s {"text":"Stardust Fragment Warning: Wormhole Potion is disabled on this server.","color":"gold"}
execute if score WormholePotionDisabled stardust.config matches 0 if entity @s[nbt={Inventory:[{tag:{stardust:{wormhole_potion:1b}}}]}] at @a if score @s stardust.wormhole = @p stardust.id run function stardust:right_click/wormhole_potion/teleport
scoreboard players reset @s stardust.wormhole
scoreboard players enable @s stardust.wormhole
