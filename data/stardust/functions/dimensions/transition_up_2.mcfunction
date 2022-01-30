
data modify storage stardust:items Temp set from entity @s Motion
tp @s ~ -5 ~
data modify entity @s Motion set from storage stardust:items Temp
