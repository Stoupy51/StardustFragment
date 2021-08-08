function stardust:ultimatecraft/verif
execute at @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{FL:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{FT:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{FS:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{EDP:1b}}},limit=1,sort=nearest,distance=..1] at @e[type=minecraft:item,nbt={Item:{id:"minecraft:dragon_egg",Count:4b}},limit=1,sort=nearest,distance=..1] run scoreboard players add @s SF_X 1

scoreboard players add @s[scores={x=3}] SF_SCraft 6
scoreboard players remove @s[scores={SF_SCraft=0..}] SF_SCraft 5
scoreboard players reset @s[scores={SF_SCraft=..0}] SF_SCraft

execute as @s[scores={SF_SCraft=10..}] run summon item ~ ~ ~ {Motion:[0.0,1.0,0.0],Item:{id:"minecraft:ghast_spawn_egg",Count:1b,tag:{UltPort:1b,EntityTag:{id:"minecraft:area_effect_cloud",Age:0,Duration:0,Radius:0f,Tags:["UltPort","SFegg"],NoAI:1b,Silent:1,ActiveEffects:[{Id:14,Amplifier:0,Duration:20,ShowParticles:0b}]},HideFlags:127,display:{Lore:['[{"text":"Ce portail permet d\'accéder à la","color":"white","italic":false}]','[{"text":"dimension de l\'Ultimate Boss !","color":"white","italic":false}]','{"text":" "}','[{"text":"[À poser sur de la Crying Obsidian]","color":"gray","italic":false}]'],Name:'[{"text":"U","color":"dark_purple","bold":"true","italic":false},{"text":"l","color":"blue"},{"text":"t","color":"dark_aqua"},{"text":"i","color":"aqua"},{"text":"m","color":"green"},{"text":"a","color":"yellow"},{"text":"t","color":"gold"},{"text":"e","color":"dark_red"},{"text":" P","color":"dark_purple"},{"text":"o","color":"blue"},{"text":"r","color":"dark_aqua"},{"text":"t","color":"aqua"},{"text":"a","color":"green"},{"text":"l","color":"yellow"}]'},Enchantments:[{lvl:0,id:"minecraft:protection"}]}}}
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{FL:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{FT:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{FS:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{Count:1b,tag:{EDP:1b}}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:dragon_egg",Count:4b}},limit=1,sort=nearest,distance=..1]
execute as @s[scores={SF_SCraft=10..}] run playsound block.anvil.use block @a[distance=..25]
execute as @s[scores={SF_SCraft=10..}] run particle smoke ~ ~ ~ 0.4 0.4 0.4 0.2 1000
execute as @s[scores={SF_SCraft=10..}] run tellraw @a ["",{"text":"\n[Stardust","color":"dark_aqua"},{"text":"Fragment] ","color":"aqua"},{"selector":"@p"},{"text":" vient de crafter un Portail "},{"text":"U","color":"dark_purple"},{"text":"l","color":"blue"},{"text":"t","color":"dark_aqua"},{"text":"i","color":"aqua"},{"text":"m","color":"green"},{"text":"e","color":"yellow"},{"text":" ","color":"gold"},{"text":"!\n"}]
kill @s[scores={SF_SCraft=10..}]
scoreboard players reset * x