
function stardust:place/block_tags
item replace entity @s container.0 with cobblestone{CustomModelData:2013201}
playsound item.crop.plant block @a[distance=..50]
tag @s add stardust.seed
tag @s add stardust.advanced_diamond_seed
tag @s add stardust.diamond_seeds

# Item display brightness and scale
data remove entity @s brightness
data modify entity @s transformation.scale[1] set value 1.035f
data modify entity @s transformation.translation[1] set value 0.015f

# Check if the block is at a valid position
execute if entity @s[type=item_display] run schedule function stardust:destroy/call_all 1t replace
execute if entity @s[type=item_display] run setblock ~ ~ ~ moss_carpet
function stardust:destroy/all
execute unless score #killed stardust.data matches 1 run setblock ~ ~ ~ moss_carpet
scoreboard players reset #killed stardust.data

