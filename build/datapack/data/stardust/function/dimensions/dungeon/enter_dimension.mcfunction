
#> stardust:dimensions/dungeon/enter_dimension
#
# @executed	as the player & at current position
#
# @within	stardust:advancements/changed_dimension
#

# Add is_in_dungeon tag and change to adventure mode
tag @s add stardust.is_in_dungeon
gamemode adventure @s[gamemode=survival]

# Increment score of players in dungeon
scoreboard players add #players_in_dungeon stardust.data 1

