
execute if predicate stardust:in_dim/celestial at @s in stardust:stardust run function stardust:dimensions/transition_up_2
execute if predicate stardust:in_dim/overworld at @s in stardust:celestial run function stardust:dimensions/transition_up_2

#Bracken pack compatibility
execute store result score #height stardust.data run data get entity @s Pos[1]
execute if score @s bp.1_second matches 0.. if score #height stardust.data matches 600..1000 if entity @s[nbt={Dimension:"bracken:pax"}] at @s in stardust:celestial run function stardust:dimensions/transition_up_2
execute if score @s bp.1_second matches 0.. if score #height stardust.data matches 500.. if predicate stardust:in_dim/stardust at @s in bracken:pax run tp ~ 1600 ~
execute if score @s bp.1_second matches 0.. if score #height stardust.data matches 1000.. if entity @s[nbt={Dimension:"bracken:pax"}] at @s in stardust:stardust run function stardust:dimensions/transition_down_2
