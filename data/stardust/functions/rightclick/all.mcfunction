
data modify storage stardust:items SelectedItemTag set from entity @s SelectedItem.tag

execute if data storage stardust:items SelectedItemTag.stardust.quarry_configurator
execute if data storage stardust:items SelectedItemTag.stardust.quarry_configurator run function stardust:rightclick/quarry_configurator/all
execute if data storage stardust:items SelectedItemTag.stardust.lucky_artifact_bag run function stardust:rightclick/lucky_artifact_bag
execute if data storage stardust:items SelectedItemTag.stardust.stardust_pillar run function stardust:rightclick/stardust_pillar
execute if data storage stardust:items SelectedItemTag.stardust.wormhole_potion run function stardust:rightclick/wormhole_potion
execute if data storage stardust:items SelectedItemTag.stardust.wither_killer run function stardust:rightclick/wither_killer
execute if data storage stardust:items SelectedItemTag.stardust.travel_staff run scoreboard players add @s stardust.data 1
execute if data storage stardust:items SelectedItemTag.stardust.snip unless score @s stardust.cooldown matches 1.. at @s run function stardust:rightclick/snipers/all

data remove storage stardust:items SelectedItemTag
scoreboard players reset @s stardust.right_click

