execute if block ~ ~ ~ minecraft:redstone_wire run setblock ~ ~ ~ air
execute unless entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:redstone"}},limit=1,sort=nearest,distance=..1] run summon minecraft:item ~ ~ ~ {Motion:[0.00,0.20,0.00],Item:{id:"minecraft:redstone",Count:1b}}
tag @e[type=minecraft:item,nbt={Item:{id:"minecraft:redstone"}},limit=1,sort=nearest,distance=..1] add SF_Drop
execute if entity @s[tag=SF_DiamondSeed] run function stardust:destroy/seeds/diamond
execute if entity @s[tag=SF_AdvancedDiamondSeed] run function stardust:destroy/seeds/advanced_diamond
execute if entity @s[tag=SF_StardustSeed] run function stardust:destroy/seeds/stardust
execute if entity @s[tag=SF_AdvancedStardustSeed] run function stardust:destroy/seeds/advanced_stardust
execute if entity @s[tag=SF_EliteStardustSeed] run function stardust:destroy/seeds/elite_stardust
execute if entity @s[tag=SF_LegendarySeed] run function stardust:destroy/seeds/legendary
execute if entity @s[tag=SF_SolarSeed] run function stardust:destroy/seeds/solar
execute if entity @s[tag=SF_DarkSeed] run function stardust:destroy/seeds/dark
tag @e[type=minecraft:item,tag=SF_Drop] remove SF_Drop
kill @s
