#Matériaux
    execute as @s[nbt={Item:{Count:64b,tag:{AS:1b}}}] run particle dust 255 0 0 1 ~ ~ ~ 5 5 5 0.1 500
    execute as @s[nbt={Item:{Count:4b,tag:{AS:1b}}}] run particle portal ~ ~ ~ 5 5 5 0.1 500
    execute as @s[nbt={Item:{Count:1b,tag:{DP:1b}}}] run particle reverse_portal ~ ~ ~ 5 5 5 0.1 500
    execute as @s[nbt={Item:{Count:64b,tag:{CStar:1b}}}] run particle dust 0 0 255 2 ~ ~ ~ 5 5 5 0.1 500
#Équipements
    execute as @s[nbt={Item:{Count:4b,tag:{DP:1b}}}] run particle dust 0 0 255 1 ~ ~ ~ 5 5 5 0.1 500
    execute as @s[nbt={Item:{Count:1b,tag:{SBow:1b}}}] run particle dust 255 0 0 1 ~ ~ ~ 5 5 5 0.1 500
	#Armure/Outils Légendaires
		execute as @s[nbt={Item:{Count:5b,tag:{FL:1b}}}] run particle happy_villager ~ ~ ~ 5 5 5 0.1 500
		execute as @s[nbt={Item:{Count:8b,tag:{FL:1b}}}] run particle happy_villager ~ ~ ~ 5 5 5 0.1 500
		execute as @s[nbt={Item:{Count:7b,tag:{FL:1b}}}] run particle happy_villager ~ ~ ~ 5 5 5 0.1 500
		execute as @s[nbt={Item:{Count:4b,tag:{FL:1b}}}] run particle happy_villager ~ ~ ~ 5 5 5 0.1 500
		execute as @s[nbt={Item:{Count:4b,tag:{FL:1b}}}] run particle happy_villager ~ ~ ~ 5 5 5 0.1 500
		execute as @s[nbt={Item:{Count:3b,tag:{FL:1b}}}] run particle happy_villager ~ ~ ~ 5 5 5 0.1 500
		execute as @s[nbt={Item:{Count:3b,tag:{FL:1b}}}] run particle happy_villager ~ ~ ~ 5 5 5 0.1 500
	#Armure/Outils Ténébreux
		execute as @s[nbt={Item:{Count:5b,tag:{FT:1b}}}] run particle dust 0 0 0 1 ~ ~ ~ 5 5 5 0.1 500
		execute as @s[nbt={Item:{Count:8b,tag:{FT:1b}}}] run particle dust 0 0 0 1 ~ ~ ~ 5 5 5 0.1 500
		execute as @s[nbt={Item:{Count:7b,tag:{FT:1b}}}] run particle dust 0 0 0 1 ~ ~ ~ 5 5 5 0.1 500
		execute as @s[nbt={Item:{Count:4b,tag:{FT:1b}}}] run particle dust 0 0 0 1 ~ ~ ~ 5 5 5 0.1 500
		execute as @s[nbt={Item:{Count:4b,tag:{FT:1b}}}] run particle dust 0 0 0 1 ~ ~ ~ 5 5 5 0.1 500
		execute as @s[nbt={Item:{Count:3b,tag:{FT:1b}}}] run particle dust 0 0 0 1 ~ ~ ~ 5 5 5 0.1 500
		execute as @s[nbt={Item:{Count:3b,tag:{FT:1b}}}] run particle dust 0 0 0 1 ~ ~ ~ 5 5 5 0.1 500
	#Armure/Outils Solaires
		execute as @s[nbt={Item:{Count:5b,tag:{FS:1b}}}] run particle flame ~ ~ ~ 5 5 5 0.1 500
		execute as @s[nbt={Item:{Count:8b,tag:{FS:1b}}}] run particle flame ~ ~ ~ 5 5 5 0.1 500
		execute as @s[nbt={Item:{Count:7b,tag:{FS:1b}}}] run particle flame ~ ~ ~ 5 5 5 0.1 500
		execute as @s[nbt={Item:{Count:4b,tag:{FS:1b}}}] run particle flame ~ ~ ~ 5 5 5 0.1 500
		execute as @s[nbt={Item:{Count:4b,tag:{FS:1b}}}] run particle flame ~ ~ ~ 5 5 5 0.1 500
		execute as @s[nbt={Item:{Count:3b,tag:{FS:1b}}}] run particle flame ~ ~ ~ 5 5 5 0.1 500
		execute as @s[nbt={Item:{Count:3b,tag:{FS:1b}}}] run particle flame ~ ~ ~ 5 5 5 0.1 500
	#Armure/Outils Ultimes
		execute as @s[nbt={Item:{tag:{CL:1b}}}] run particle dust 255 255 255 1 ~ ~ ~ 5 5 5 0.1 500
		execute as @s[nbt={Item:{tag:{PL:1b}}}] run particle dust 255 255 255 1 ~ ~ ~ 5 5 5 0.1 500
		execute as @s[nbt={Item:{tag:{JL:1b}}}] run particle dust 255 255 255 1 ~ ~ ~ 5 5 5 0.1 500
		execute as @s[nbt={Item:{tag:{BL:1b}}}] run particle dust 255 255 255 1 ~ ~ ~ 5 5 5 0.1 500
		execute as @s[nbt={Item:{tag:{EL:1b}}}] run particle dust 255 255 255 1 ~ ~ ~ 5 5 5 0.1 500
		execute as @s[nbt={Item:{tag:{PiL:1b}}}] run particle dust 255 255 255 1 ~ ~ ~ 5 5 5 0.1 500
		execute as @s[nbt={Item:{tag:{HL:1b}}}] run particle dust 255 255 255 1 ~ ~ ~ 5 5 5 0.1 500
		execute as @s[nbt={Item:{tag:{ASBow:1b}}}] run particle dust 255 255 255 1 ~ ~ ~ 5 5 5 0.1 500
	#Artefacts Lv.Max
	execute as @s[nbt={Item:{Count:2b,tag:{ArtHp3:1b}}}] run particle heart ~ ~ ~ 5 5 5 0.1 100
	execute as @s[nbt={Item:{Count:2b,tag:{ArtDmg3:1b}}}] run particle ash ~ ~ ~ 5 5 5 0.1 5000
	execute as @s[nbt={Item:{Count:2b,tag:{ArtSpeed3:1b}}}] run particle cloud ~ ~ ~ 5 5 5 0 100
	#Artefact Ultime + Spawneur à Items spéciaux
	execute as @s[nbt={Item:{tag:{CU:1b}}}] run particle dust 255 255 255 1 ~ ~ ~ 5 5 5 0.1 500
	execute as @s[nbt={Item:{tag:{8C:1b}}}] run particle dust 255 255 255 1 ~ ~ ~ 5 5 5 0.1 500
#Graines
	execute as @s[nbt={Item:{id:"minecraft:feather",Count:64b}}] run particle happy_villager ~ ~ ~ 5 5 5 0.1 500
	execute as @s[nbt={Item:{id:"minecraft:obsidian",Count:64b}}] run particle dust 0 0 0 1 ~ ~ ~ 5 5 5 0.1 500
	execute as @s[nbt={Item:{id:"minecraft:lava_bucket",Count:1b}}] run particle flame ~ ~ ~ 5 5 5 0.1 500
#Quarry
	execute as @s[nbt={Item:{id:"minecraft:netherite_pickaxe",Count:1b}}] run particle dust 0.5 0.5 0.5 1 ~ ~ ~ 5 5 5 0.1 500
	execute as @s[nbt={Item:{Count:1b,tag:{QuarryLv1:1b}}}] run particle dust 0.5 0.5 0.5 1 ~ ~ ~ 5 5 5 0.1 500
	execute as @s[nbt={Item:{Count:1b,tag:{QuarryLv2:1b}}}] run particle dust 0.5 0.5 0.5 1 ~ ~ ~ 5 5 5 0.1 500
	execute as @s[nbt={Item:{Count:1b,tag:{QuarryLv3:1b}}}] run particle dust 0.5 0.5 0.5 1 ~ ~ ~ 5 5 5 0.1 500
	execute as @s[nbt={Item:{Count:1b,tag:{QuarryLv4:1b}}}] run particle dust 0.5 0.5 0.5 1 ~ ~ ~ 5 5 5 0.1 500
#Autres
    execute as @s[nbt={Item:{id:"minecraft:dragon_egg",Count:1b}}] run particle dust 1 1 1 1 ~ ~ ~ 5 5 5 0.1 500
	execute as @s[nbt={Item:{Count:1b,tag:{PdS:1b}}}] run particle dust 255 0 0 1 ~ ~ ~ 5 5 5 0.1 500
	execute as @s[nbt={Item:{id:"minecraft:crying_obsidian",Count:64b}}] run particle dust 255 255 255 1 ~ ~ ~ 5 5 5 0.1 500
	execute as @s[nbt={Item:{id:"minecraft:wither_skeleton_skull",Count:1b}}] run particle dust 0.5 0.5 0.5 1 ~ ~ ~ 5 5 5 0.1 500
	execute as @s[nbt={Item:{id:"minecraft:blue_orchid",Count:2b}}] run particle falling_water ~ ~ ~ 5 5 5 0.1 500
	execute as @s[nbt={Item:{id:"minecraft:sunflower",Count:2b}}] run particle falling_lava ~ ~ ~ 5 5 5 0.1 500
	execute as @s[nbt={Item:{Count:16b,tag:{CStar:1b}}}] run particle happy_villager ~ ~ ~ 5 5 5 0.1 500
	execute as @s[nbt={Item:{Count:1b,tag:{PTeuse:1b}}}] run particle dust 0.5 0.5 0.5 1 ~ ~ ~ 5 5 5 0.1 500

playsound block.lava.extinguish ambient @a ~ ~ ~ 0.2