
data modify storage stardust:items temp set from entity @s Motion
tp @s ~ -5 ~
effect give @s[type=player] levitation 3 255 true
execute if entity @s[type=player] run summon area_effect_cloud ~ -30 ~ {Tags:["stardust.dimension_platform"],Duration:100}
data modify entity @s Motion set from storage stardust:items temp
