
clear @s minecraft:warped_fungus_on_a_stick{stardust:{wither_killer:1b}} 1
kill @e[type=wither,distance=..100]
playsound entity.wither.shoot block @a
particle smoke ~ ~ ~ 0.4 0.4 0.4 0.2 1000
