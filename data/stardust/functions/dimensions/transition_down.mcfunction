
#Bracken pack compatibility
execute if score @s bp.1_second matches 0.. if predicate stardust:in_dim/celestial at @s in bracken:pax run tp @s ~ 575 ~

execute if predicate stardust:in_dim/celestial run advancement grant @s only stardust:visible/adventure/falling_celestial
execute if predicate stardust:in_dim/celestial in overworld run function stardust:dimensions/transition_down_2
execute if predicate stardust:in_dim/stardust run advancement grant @s only stardust:visible/adventure/falling_stardust
execute if predicate stardust:in_dim/stardust at @s in stardust:celestial run function stardust:dimensions/transition_down_2
execute if entity @s[nbt={Dimension:"stardust:dungeon"}] at @s in stardust:stardust run function stardust:dimensions/transition_down_2
execute if entity @s[nbt={Dimension:"stardust:ultimate"}] at @s in stardust:stardust run function stardust:dimensions/transition_down_2
