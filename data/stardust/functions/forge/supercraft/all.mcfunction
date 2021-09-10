#Matériaux
	execute as @s[nbt={Item:{Count:64b,tag:{SF_AwakenedStardust:1s}}}] run function stardust:supercraft/mat/stardustblock
	execute as @s[nbt={Item:{Count:4b,tag:{SF_AwakenedStardust:1s}}}] run function stardust:supercraft/mat/dragonpearl
	execute as @s[nbt={Item:{Count:1b,tag:{SF_DragonPearl:1s}}}] run function stardust:supercraft/mat/enderdragonpearl
	execute as @s[nbt={Item:{Count:64b,tag:{CStar:1b}}}] run function stardust:supercraft/mat/supercompactedstardust
#Équipements
	execute as @s[nbt={Item:{Count:4b,tag:{SF_DragonPearl:1s}}}] run function stardust:supercraft/stardustbow
	execute as @s[nbt={Item:{Count:1b,tag:{SBow:1b}}}] run function stardust:supercraft/awakenedstardustbow
	#Armure/Outils Légendaires
		execute as @s[nbt={Item:{Count:5b,tag:{FL:1b}}}] at @e[type=item,nbt={Item:{Count:1b,tag:{CO:1b}}},limit=1,sort=nearest,distance=..1] run function stardust:supercraft/legend/casque
		execute as @s[nbt={Item:{Count:8b,tag:{FL:1b}}}] at @e[type=item,nbt={Item:{Count:1b,tag:{PO:1b}}},limit=1,sort=nearest,distance=..1] run function stardust:supercraft/legend/plastron
		execute as @s[nbt={Item:{Count:7b,tag:{FL:1b}}}] at @e[type=item,nbt={Item:{Count:1b,tag:{JO:1b}}},limit=1,sort=nearest,distance=..1] run function stardust:supercraft/legend/jambieres
		execute as @s[nbt={Item:{Count:4b,tag:{FL:1b}}}] at @e[type=item,nbt={Item:{Count:1b,tag:{BO:1b}}},limit=1,sort=nearest,distance=..1] run function stardust:supercraft/legend/bottes
		execute as @s[nbt={Item:{Count:4b,tag:{FL:1b}}}] at @e[type=item,nbt={Item:{Count:1b,tag:{EO:1b}}},limit=1,sort=nearest,distance=..1] run function stardust:supercraft/legend/epee
		execute as @s[nbt={Item:{Count:3b,tag:{FL:1b}}}] at @e[type=item,nbt={Item:{Count:1b,tag:{PiO:1b}}},limit=1,sort=nearest,distance=..1] run function stardust:supercraft/legend/pioche
		execute as @s[nbt={Item:{Count:3b,tag:{FL:1b}}}] at @e[type=item,nbt={Item:{Count:1b,tag:{HO:1b}}},limit=1,sort=nearest,distance=..1] run function stardust:supercraft/legend/hache
	#Armure/Outils Ténébreux
		execute as @s[nbt={Item:{Count:5b,tag:{FT:1b}}}] at @e[type=item,nbt={Item:{Count:1b,tag:{CO:1b}}},limit=1,sort=nearest,distance=..1] run function stardust:supercraft/dark/casque
		execute as @s[nbt={Item:{Count:8b,tag:{FT:1b}}}] at @e[type=item,nbt={Item:{Count:1b,tag:{PO:1b}}},limit=1,sort=nearest,distance=..1] run function stardust:supercraft/dark/plastron
		execute as @s[nbt={Item:{Count:7b,tag:{FT:1b}}}] at @e[type=item,nbt={Item:{Count:1b,tag:{JO:1b}}},limit=1,sort=nearest,distance=..1] run function stardust:supercraft/dark/jambieres
		execute as @s[nbt={Item:{Count:4b,tag:{FT:1b}}}] at @e[type=item,nbt={Item:{Count:1b,tag:{BO:1b}}},limit=1,sort=nearest,distance=..1] run function stardust:supercraft/dark/bottes
		execute as @s[nbt={Item:{Count:4b,tag:{FT:1b}}}] at @e[type=item,nbt={Item:{Count:1b,tag:{EO:1b}}},limit=1,sort=nearest,distance=..1] run function stardust:supercraft/dark/epee
		execute as @s[nbt={Item:{Count:3b,tag:{FT:1b}}}] at @e[type=item,nbt={Item:{Count:1b,tag:{PiO:1b}}},limit=1,sort=nearest,distance=..1] run function stardust:supercraft/dark/pioche
		execute as @s[nbt={Item:{Count:3b,tag:{FT:1b}}}] at @e[type=item,nbt={Item:{Count:1b,tag:{HO:1b}}},limit=1,sort=nearest,distance=..1] run function stardust:supercraft/dark/hache
	#Armure/Outils Solaires
		execute as @s[nbt={Item:{Count:5b,tag:{FS:1b}}}] at @e[type=item,nbt={Item:{Count:1b,tag:{CO:1b}}},limit=1,sort=nearest,distance=..1] run function stardust:supercraft/solar/casque
		execute as @s[nbt={Item:{Count:8b,tag:{FS:1b}}}] at @e[type=item,nbt={Item:{Count:1b,tag:{PO:1b}}},limit=1,sort=nearest,distance=..1] run function stardust:supercraft/solar/plastron
		execute as @s[nbt={Item:{Count:7b,tag:{FS:1b}}}] at @e[type=item,nbt={Item:{Count:1b,tag:{JO:1b}}},limit=1,sort=nearest,distance=..1] run function stardust:supercraft/solar/jambieres
		execute as @s[nbt={Item:{Count:4b,tag:{FS:1b}}}] at @e[type=item,nbt={Item:{Count:1b,tag:{BO:1b}}},limit=1,sort=nearest,distance=..1] run function stardust:supercraft/solar/bottes
		execute as @s[nbt={Item:{Count:4b,tag:{FS:1b}}}] at @e[type=item,nbt={Item:{Count:1b,tag:{EO:1b}}},limit=1,sort=nearest,distance=..1] run function stardust:supercraft/solar/epee
		execute as @s[nbt={Item:{Count:3b,tag:{FS:1b}}}] at @e[type=item,nbt={Item:{Count:1b,tag:{PiO:1b}}},limit=1,sort=nearest,distance=..1] run function stardust:supercraft/solar/pioche
		execute as @s[nbt={Item:{Count:3b,tag:{FS:1b}}}] at @e[type=item,nbt={Item:{Count:1b,tag:{HO:1b}}},limit=1,sort=nearest,distance=..1] run function stardust:supercraft/solar/hache
	#Artefacts Lv.Max
	execute as @s[nbt={Item:{Count:2b,tag:{ArtHp3:1b}}}] at @s run function stardust:supercraft/artmax/health
	execute as @s[nbt={Item:{Count:2b,tag:{ArtDmg3:1b}}}] at @s run function stardust:supercraft/artmax/damage
	execute as @s[nbt={Item:{Count:2b,tag:{ArtSpeed3:1b}}}] at @s run function stardust:supercraft/artmax/speed
#Graines
	execute as @s[nbt={Item:{id:"minecraft:feather",Count:64b}}] run function stardust:supercraft/legendseed
	execute as @s[nbt={Item:{id:"minecraft:obsidian",Count:64b}}] run function stardust:supercraft/darkseed
	execute as @s[nbt={Item:{id:"minecraft:lava_bucket",Count:1b}}] run function stardust:supercraft/solarseed
#Quarry
	execute as @s[nbt={Item:{id:"minecraft:netherite_pickaxe",Count:1b}}] run function stardust:supercraft/quarry/1
	execute as @s[nbt={Item:{Count:1b,tag:{QuarryLv1:1b}}}] run function stardust:supercraft/quarry/2
	execute as @s[nbt={Item:{Count:1b,tag:{QuarryLv2:1b}}}] run function stardust:supercraft/quarry/3
	execute as @s[nbt={Item:{Count:1b,tag:{QuarryLv3:1b}}}] run function stardust:supercraft/quarry/4
	execute as @s[nbt={Item:{Count:1b,tag:{QuarryLv4:1b}}}] run function stardust:supercraft/quarry/5
#Autres
	execute as @s[nbt={Item:{id:"minecraft:dragon_egg",Count:1b}}] run function stardust:supercraft/aimant
	execute as @s[nbt={Item:{Count:1b,tag:{PdS:1b}}}] run function stardust:supercraft/donjonportal
	execute as @s[nbt={Item:{id:"minecraft:wither_skeleton_skull",Count:1b}}] run function stardust:supercraft/witherkiller
	execute as @s[nbt={Item:{id:"minecraft:blue_orchid",Count:2b}}] run function stardust:supercraft/rainstart
	execute as @s[nbt={Item:{id:"minecraft:sunflower",Count:2b}}] run function stardust:supercraft/rainstop
	execute as @s[nbt={Item:{Count:16b,tag:{CStar:1b}}}] run function stardust:supercraft/emeraldspawner
    execute as @s[nbt={Item:{Count:1b,tag:{PTeuse:1b}}}] run function stardust:supercraft/superpelleteuse
