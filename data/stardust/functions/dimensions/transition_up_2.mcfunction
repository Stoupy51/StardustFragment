
data modify storage stardust:items temp set from entity @s Motion
tp @s ~ -5 ~
data modify entity @s Motion set from storage stardust:items temp
