
scoreboard players set #success stardust.data 0
execute store success score #success stardust.data if entity @s[y_rotation=-46..45] run function stardust:place/glow_item_frame_4
execute if score #success stardust.data matches 0 store success score #success stardust.data if entity @s[y_rotation=45..135] run function stardust:place/glow_item_frame_6
execute if score #success stardust.data matches 0 store success score #success stardust.data if entity @s[y_rotation=135..225] run function stardust:place/glow_item_frame_0
execute if score #success stardust.data matches 0 store success score #success stardust.data if entity @s[y_rotation=225..315] run function stardust:place/glow_item_frame_2
