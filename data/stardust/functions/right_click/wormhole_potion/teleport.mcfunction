
tellraw @a [{"selector":"@s","italic":false,"color":"yellow"},{"text":" teleported himself to "},{"selector":"@p","italic":false,"color":"yellow"}]
particle portal ~ ~1 ~ 1 1 1 1 1000
playsound stardust:wormhole_potion ambient @a[distance=..50]
clear @s warped_fungus_on_a_stick{stardust:{wormhole_potion:1b}} 1
tp @s @p

