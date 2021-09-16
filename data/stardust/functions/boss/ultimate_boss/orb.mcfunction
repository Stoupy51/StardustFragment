summon minecraft:area_effect_cloud -20 100 -20 {Tags:["SF_RandomizeOrb"]}
execute as @e[type=area_effect_cloud,tag=SF_RandomizeOrb] run function stardust:boss/ultimate_boss/orb_pos
