setblock ~ ~ ~ minecraft:deepslate_diamond_ore
execute run summon item_frame ~ ~ ~ {ItemRotation:0b,Tags:["SF_Destroyer","SF_DestroyDeepslateDiamondOre","SF_DeepslateStardustOre","SF_Ore"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"barrel",Count:1b,tag:{CustomModelData:2013025}}}
kill @s
