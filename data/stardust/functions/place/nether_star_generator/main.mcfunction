
scoreboard players set #success stardust.data 0
execute store success score #success stardust.data if entity @s[y_rotation=-46..45] run setblock ~ ~ ~ furnace[facing=north]{CustomName:'[{"text":"Nether Star Generator"}]'}
execute if score #success stardust.data matches 0 store success score #success stardust.data if entity @s[y_rotation=45..135] run setblock ~ ~ ~ furnace[facing=east]{CustomName:'[{"text":"Nether Star Generator"}]'}
execute if score #success stardust.data matches 0 store success score #success stardust.data if entity @s[y_rotation=135..225] run setblock ~ ~ ~ furnace[facing=south]{CustomName:'[{"text":"Nether Star Generator"}]'}
execute if score #success stardust.data matches 0 store success score #success stardust.data if entity @s[y_rotation=225..315] run setblock ~ ~ ~ furnace[facing=west]{CustomName:'[{"text":"Nether Star Generator"}]'}

function stardust:place/glow_item_frame_rotation
execute as @e[type=glow_item_frame,tag=stardust.set_new] at @s run function stardust:place/nether_star_generator/secondary
