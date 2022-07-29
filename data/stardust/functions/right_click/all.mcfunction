
data modify storage stardust:main SelectedItemTag set from entity @s SelectedItem.tag

execute if data storage stardust:main SelectedItemTag.stardust.quarry_configurator run function stardust:right_click/quarry_configurator/main
execute if data storage stardust:main SelectedItemTag.stardust.lucky_artifact_bag run function stardust:right_click/lucky_artifact_bag/main
execute if data storage stardust:main SelectedItemTag.stardust.stardust_pillar run function stardust:right_click/stardust_pillar/main
execute if data storage stardust:main SelectedItemTag.stardust.wormhole_potion run function stardust:right_click/wormhole_potion/main
execute if data storage stardust:main SelectedItemTag.stardust.wither_killer run function stardust:right_click/wither_killer/main
execute if data storage stardust:main SelectedItemTag.stardust.travel_staff run function stardust:right_click/travel_staff/main
execute if data storage stardust:main SelectedItemTag.stardust.snip unless score @s stardust.cooldown matches 1.. at @s run function stardust:right_click/snipers/all

data remove storage stardust:main SelectedItemTag
scoreboard players reset @s stardust.right_click

