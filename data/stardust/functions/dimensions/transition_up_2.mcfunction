
data modify storage stardust:temp all set from entity @s Motion
tp @s ~ -5 ~
effect give @s[type=player] levitation 3 255 true
execute if entity @s[type=player] run summon marker ~ -30 ~ {Tags:["stardust.dimension_platform"]}
data modify entity @s Motion set from storage stardust:temp all
