
data modify storage stardust:main SelectedItemTag set from entity @s SelectedItem.tag

execute if data storage stardust:main SelectedItemTag.stardust.quarry_configurator run function stardust:right_click/quarry_configurator/all
execute if data storage stardust:main SelectedItemTag.stardust.lucky_artifact_bag run function stardust:right_click/lucky_artifact_bag
execute if data storage stardust:main SelectedItemTag.stardust.stardust_pillar run function stardust:right_click/stardust_pillar
execute if data storage stardust:main SelectedItemTag.stardust.wormhole_potion run function stardust:right_click/wormhole_potion
execute if data storage stardust:main SelectedItemTag.stardust.wither_killer run function stardust:right_click/wither_killer
execute if data storage stardust:main SelectedItemTag.stardust.travel_staff run scoreboard players add @s stardust.data 1
execute if data storage stardust:main SelectedItemTag.stardust.snip unless score @s stardust.cooldown matches 1.. at @s run function stardust:right_click/snipers/all

data remove storage stardust:main SelectedItemTag
scoreboard players reset @s stardust.right_click

