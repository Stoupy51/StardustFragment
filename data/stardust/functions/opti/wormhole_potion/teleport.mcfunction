tellraw @a [{"selector":"@s","italic":false,"color":"yellow"},{"text":" teleported himself to "},{"selector":"@p","italic":false,"color":"yellow"}]
particle minecraft:portal ~ ~1 ~ 1 1 1 1 10000
playsound stardust:wormhole_potion ambient @a[distance=..50]
clear @s minecraft:warped_fungus_on_a_stick{SF_WormholePotion:1b} 1
tp @s @p
