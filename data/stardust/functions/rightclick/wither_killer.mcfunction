clear @s minecraft:warped_fungus_on_a_stick{StardustFragment_WitherKiller:1b} 1
kill @e[type=wither,distance=..100]
playsound minecraft:entity.wither.shoot block @a
particle minecraft:smoke ~ ~ ~ 0.4 0.4 0.4 0.2 1000
