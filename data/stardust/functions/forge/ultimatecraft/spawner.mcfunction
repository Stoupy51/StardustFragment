function stardust:ultimatecraft/verif
execute at @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{CU:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{Count:64b,tag:{FL:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{Count:64b,tag:{FT:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{Count:64b,tag:{FS:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{Count:16b,tag:{C:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{Count:32b,tag:{EDP:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{id:"minecraft:dragon_egg",Count:16b}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{id:"minecraft:beacon",Count:64b}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{id:"minecraft:crying_obsidian",Count:64b}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{id:"minecraft:spawner",Count:64b}},limit=1,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1
execute at @e[type=minecraft:item,nbt={Item:{Count:64b,tag:{ASB:1b}}},limit=4,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1
execute at @e[type=minecraft:item,nbt={Item:{id:"minecraft:emerald_block",Count:64b}},limit=4,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1
execute at @e[type=minecraft:item,nbt={Item:{id:"minecraft:nether_star",Count:64b}},limit=2,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1

scoreboard players add @s[scores={x=13}] SF_SCraft 6
scoreboard players remove @s[scores={SF_SCraft=0..}] SF_SCraft 5
scoreboard players reset @s[scores={SF_SCraft=..0}] SF_SCraft

execute as @s[scores={SF_SCraft=10..}] run summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:ghast_spawn_egg",Count:1b,tag:{SaIS:1b,EntityTag:{id:"minecraft:area_effect_cloud",Age:0,Duration:0,Radius:0f,Tags:["SaIS","SFegg"],NoAI:1b,Silent:1,ActiveEffects:[{Id:14,Amplifier:0,Duration:20,ShowParticles:0b}]},HideFlags:127,display:{Lore:['[{"text":"Ce Spawner est tout simplement ultime !","italic":false,"color":"white"}]'],Name:'[{"text":"U","italic":false,"color":"dark_purple","bold":"true"},{"text":"l","italic":false,"color":"blue"},{"text":"t","italic":false,"color":"dark_aqua"},{"text":"i","italic":false,"color":"aqua"},{"text":"m","italic":false,"color":"green"},{"text":"a","italic":false,"color":"yellow"},{"text":"t","italic":false,"color":"gold"},{"text":"e","italic":false,"color":"dark_red"},{"text":" S","italic":false,"color":"dark_purple"},{"text":"p","italic":false,"color":"blue"},{"text":"a","italic":false,"color":"dark_aqua"},{"text":"w","italic":false,"color":"aqua"},{"text":"n","italic":false,"color":"green"},{"text":"e","italic":false,"color":"yellow"},{"text":"r","italic":false,"color":"gold"}]'},Enchantments:[{lvl:0,id:"minecraft:protection"}]}}}
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{CU:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{Count:64b,tag:{FL:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{Count:64b,tag:{FT:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{Count:64b,tag:{FS:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{Count:16b,tag:{C:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{Count:32b,tag:{EDP:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:dragon_egg",Count:16b}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:beacon",Count:64b}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:crying_obsidian",Count:64b}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:spawner",Count:64b}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{Count:64b,tag:{ASB:1b}}},limit=4,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:emerald_block",Count:64b}},limit=4,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:golden_carrot",Count:64b}},limit=2,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:nether_star",Count:64b}},limit=2,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run playsound entity.wither.spawn block @a
execute as @s[scores={SF_SCraft=10..}] run particle smoke ~ ~ ~ 0.4 0.4 0.4 0.2 1000
execute as @s[scores={SF_SCraft=10..}] run tellraw @a ["",{"text":"\n[Stardust","italic":false,"color":"dark_aqua"},{"text":"Fragment] ","italic":false,"color":"aqua"},{"selector":"@p"},{"text":" vient de crafter l'"},{"text":"U","italic":false,"color":"dark_purple"},{"text":"l","italic":false,"color":"blue"},{"text":"t","italic":false,"color":"dark_aqua"},{"text":"i","italic":false,"color":"aqua"},{"text":"m","italic":false,"color":"green"},{"text":"e","italic":false,"color":"yellow"},{"text":" S","italic":false,"color":"dark_purple"},{"text":"p","italic":false,"color":"blue"},{"text":"a","italic":false,"color":"dark_aqua"},{"text":"w","italic":false,"color":"aqua"},{"text":"n","italic":false,"color":"green"},{"text":"e","italic":false,"color":"yellow"},{"text":"r ","italic":false,"color":"gold"},{"text":"!\n"}]
kill @s[scores={SF_SCraft=10..}]

scoreboard players reset * x
