execute if block ~ ~ ~ minecraft:moss_carpet run setblock ~ ~ ~ air
execute unless entity @e[type=item,nbt={Item:{id:"minecraft:moss_carpet"}},predicate=!stardust:has_tag,limit=1,sort=nearest,distance=..1] run summon minecraft:item ~ ~ ~ {Motion:[0.00,0.20,0.00],Item:{id:"minecraft:moss_carpet",Count:1b}}
tag @e[type=item,nbt={Item:{id:"minecraft:moss_carpet"}},predicate=!stardust:has_tag,limit=1,sort=nearest,distance=..1] add SF_Drop
execute as @s[tag=SF_DiamondSeed] run function stardust:destroy/seeds/diamond
execute as @s[tag=SF_AdvancedDiamondSeed] run function stardust:destroy/seeds/advanced_diamond
execute as @s[tag=SF_StardustSeed] run function stardust:destroy/seeds/stardust
execute as @s[tag=SF_AdvancedStardustSeed] run function stardust:destroy/seeds/advanced_stardust
execute as @s[tag=SF_EliteStardustSeed] run function stardust:destroy/seeds/elite_stardust
execute as @s[tag=SF_LegendarySeed] run function stardust:destroy/seeds/legendary
execute as @s[tag=SF_SolarSeed] run function stardust:destroy/seeds/solar
execute as @s[tag=SF_DarkSeed] run function stardust:destroy/seeds/dark
tag @e[type=item,tag=SF_Drop] remove SF_Drop
kill @s
