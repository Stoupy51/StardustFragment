#Nether Stardust Ore
execute if block ~ ~ ~ netherrack run summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["global.ignore","global.ignore.kill","smithed.block","StardustFragment_Destroyer","StardustFragment_NetherStardustOre","StardustFragment_Ore"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"barrel",Count:1b,tag:{CustomModelData:2013026}}}
execute if block ~ ~ ~ netherrack run setblock ~ ~ ~ minecraft:nether_quartz_ore

#Ender Stardust Ore
execute if block ~ ~ ~ end_stone run summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["global.ignore","global.ignore.kill","smithed.block","StardustFragment_Destroyer","StardustFragment_DestroyDeepslateDiamondOre","StardustFragment_EnderStardustOre","StardustFragment_Ore"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"barrel",Count:1b,tag:{CustomModelData:2013027}}}

#Deepslate Stardust Ore
execute if block ~ ~ ~ deepslate run summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["global.ignore","global.ignore.kill","smithed.block","StardustFragment_Destroyer","StardustFragment_DestroyDeepslateDiamondOre","StardustFragment_DeepslateStardustOre","StardustFragment_Ore"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"barrel",Count:1b,tag:{CustomModelData:2013025}}}

#Stardust Ore
execute unless block ~ ~ ~ nether_quartz_ore unless block ~ ~ ~ deepslate unless block ~ ~ ~ end_stone run summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["global.ignore","global.ignore.kill","smithed.block","StardustFragment_Destroyer","StardustFragment_DestroyDeepslateDiamondOre","StardustFragment_StardustOre","StardustFragment_Ore"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"barrel",Count:1b,tag:{CustomModelData:2013023}}}



#Setblock to deepslate_diamond_ore
execute unless block ~ ~ ~ nether_quartz_ore run setblock ~ ~ ~ minecraft:deepslate_diamond_ore

#Update Stats
execute align xyz as @e[type=glow_item_frame,tag=StardustFragment_DestroyDeepslateDiamondOre,tag=!StardustFragment_EnderStardustOre,dx=0,dy=0,dz=0,limit=1] run scoreboard players add StardustOreCount StardustFragment_AdvancedStats 1
