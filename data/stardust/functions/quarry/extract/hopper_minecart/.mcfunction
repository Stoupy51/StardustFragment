
tag @s add stardust.hopper_minecart
data modify entity @s Enabled set value 0b
execute unless data entity @s Items[4] run function stardust:quarry/extract/hopper_minecart/secondary

