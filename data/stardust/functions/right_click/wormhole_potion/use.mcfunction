
execute if score WormholePotionDisabled stardust.config matches 1 run playsound entity.villager.no ambient @s
execute if score WormholePotionDisabled stardust.config matches 1 run tellraw @s {"text":"Stardust Fragment Warning: Wormhole Potion is disabled on this server.","color":"gold"}
execute unless score WormholePotionDisabled stardust.config matches 1 if entity @s[gamemode=!spectator,nbt={Inventory:[{tag:{stardust:{wormhole_potion:1b}}}]}] at @a[gamemode=!spectator] if score @s stardust.wormhole = @p stardust.id run function stardust:right_click/wormhole_potion/teleport
scoreboard players reset @s stardust.wormhole
scoreboard players enable @s stardust.wormhole

