
#> stardust:mobs/check_dimension
#
# @executed	at @s
#
# @within	stardust:v4.0.0/second [ at @s ]
#

# Mark as checked
tag @s add stardust.dim_checked

# Switch case on dimension
execute if dimension stardust:cavern run return run function stardust:mobs/convert/cavern
execute if dimension stardust:celestial run return run function stardust:mobs/convert/celestial
execute if dimension stardust:stardust run return run function stardust:mobs/convert/stardust
execute if dimension stardust:dungeon run return run function stardust:mobs/convert/dungeon
execute if dimension stardust:ultimate run return run function stardust:mobs/convert/ultimate

