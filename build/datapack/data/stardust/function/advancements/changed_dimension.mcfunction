
#> stardust:advancements/changed_dimension
#
# @executed	as the player & at current position
#
# @within	advancement stardust:technical/changed_dimension
#

# Revoke advancement
advancement revoke @s only stardust:technical/changed_dimension

# If in stardust:dungeon, and in survival mode, and no is_in_dungeon tag, move to adventure mode
execute if dimension stardust:dungeon if entity @s[gamemode=survival,tag=!stardust.is_in_dungeon] run function stardust:dimensions/dungeon/enter_dimension

# Do the opposite
execute unless dimension stardust:dungeon if entity @s[tag=stardust.is_in_dungeon] run function stardust:dimensions/dungeon/exit_dimension

