execute if block ~ ~ ~ minecraft:moss_carpet run setblock ~ ~ ~ air
execute unless entity @e[type=item,nbt={Item:{id:"minecraft:moss_carpet"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] run summon minecraft:item ~ ~ ~ {Motion:[0.00,0.20,0.00],Item:{id:"minecraft:moss_carpet",Count:1b}}
tag @e[type=item,nbt={Item:{id:"minecraft:moss_carpet"}},predicate=!simplenergy:has_tag,limit=1,sort=nearest,distance=..1] add StardustFragment_Drop
execute as @s[tag=StardustFragment_DiamondSeed] run function stardust:destroy/seeds/diamond
execute as @s[tag=StardustFragment_AdvancedDiamondSeed] run function stardust:destroy/seeds/advanced_diamond
execute as @s[tag=StardustFragment_StardustSeed] run function stardust:destroy/seeds/stardust
execute as @s[tag=StardustFragment_AdvancedStardustSeed] run function stardust:destroy/seeds/advanced_stardust
execute as @s[tag=StardustFragment_EliteStardustSeed] run function stardust:destroy/seeds/elite_stardust
execute as @s[tag=StardustFragment_LegendarySeed] run function stardust:destroy/seeds/legendary
execute as @s[tag=StardustFragment_SolarSeed] run function stardust:destroy/seeds/solar
execute as @s[tag=StardustFragment_DarkSeed] run function stardust:destroy/seeds/dark
tag @e[type=item,tag=StardustFragment_Drop] remove StardustFragment_Drop
kill @s
