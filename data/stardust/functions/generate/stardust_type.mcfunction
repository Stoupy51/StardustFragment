execute if block ~ ~ ~ netherrack run summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["StardustFragment_Destroyer","StardustFragment_NetherStardustOre","StardustFragment_Ore"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"barrel",Count:1b,tag:{CustomModelData:2013026}}}
execute if block ~ ~ ~ netherrack run setblock ~ ~ ~ minecraft:nether_quartz_ore
execute if block ~ ~ ~ deepslate run summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["StardustFragment_Destroyer","StardustFragment_DestroyDeepslateDiamondOre","StardustFragment_DeepslateStardustOre","StardustFragment_Ore"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"barrel",Count:1b,tag:{CustomModelData:2013025}}}
execute if block ~ ~ ~ end_stone run summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["StardustFragment_Destroyer","StardustFragment_DestroyDeepslateDiamondOre","StardustFragment_EnderStardustOre","StardustFragment_Ore"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"barrel",Count:1b,tag:{CustomModelData:2013027}}}
execute unless block ~ ~ ~ nether_quartz_ore unless block ~ ~ ~ deepslate unless block ~ ~ ~ end_stone run summon glow_item_frame ~ ~ ~ {ItemRotation:0b,Tags:["StardustFragment_Destroyer","StardustFragment_DestroyDeepslateDiamondOre","StardustFragment_StardustOre","StardustFragment_Ore"],Invisible:1b,Invulnerable:1b,Fixed:1b,Silent:1b,Facing:1b,Item:{id:"barrel",Count:1b,tag:{CustomModelData:2013023}}}
execute unless block ~ ~ ~ nether_quartz_ore run setblock ~ ~ ~ minecraft:deepslate_diamond_ore
