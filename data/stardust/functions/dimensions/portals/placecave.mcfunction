summon item ~ ~ ~ {Motion:[0.0,0.4,0.0],Item:{id:"minecraft:ghast_spawn_egg",Count:1b,tag:{PdC:1b,EntityTag:{id:"minecraft:area_effect_cloud",Age:0,Duration:0,Radius:0f,Tags:["PdC","SFegg"],NoAI:1b,Silent:1,ActiveEffects:[{Id:14,Amplifier:0,Duration:20,ShowParticles:0b}]},HideFlags:127,display:{Lore:['[{"text":"Ce portail permet d\'accéder à un","color":"white","italic":false}]','[{"text":"monde rempli de cavernes !","color":"white","italic":false}]','{"text":" "}','[{"text":"[À poser sur un Iron Block]","color":"gray","italic":false}]'],Name:'[{"text":"Portail des Cavernes","color":"dark_gray","italic":false}]'}}}}
execute if block ~ ~-1 ~ iron_block unless entity @e[type=minecraft:glow_item_frame,tag=SF_Portal,distance=..1.1] run kill @e[type=item,nbt={Item:{Count:1b,tag:{PdC:1b}}},limit=1,sort=nearest,distance=..1.1]
execute if block ~ ~-1 ~ iron_block unless entity @e[type=minecraft:glow_item_frame,tag=SF_Portal,distance=..1.1] run playsound block.anvil.place block @a
execute if block ~ ~-1 ~ iron_block unless entity @e[type=minecraft:glow_item_frame,tag=SF_Portal,distance=..1.1] run particle soul ~ ~ ~ 0.5 1 0.5 0.05 200
execute if block ~ ~-1 ~ iron_block unless entity @e[type=minecraft:glow_item_frame,tag=SF_Portal,distance=..1.1] run summon armor_stand ~ ~ ~ {Tags:["SF_Portal","tpCave"],NoGravity:1b,Marker:1b,Invisible:1,Invulnerable:1}
tp @s 0 -10000 0