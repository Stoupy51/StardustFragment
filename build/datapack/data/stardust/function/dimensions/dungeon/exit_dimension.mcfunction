
#> stardust:dimensions/dungeon/exit_dimension
#
# @executed	as the player & at current position
#
# @within	stardust:advancements/changed_dimension
#

# Remove is_in_dungeon tag and change to survival mode
tag @s remove stardust.is_in_dungeon
gamemode survival @s[gamemode=adventure]

# Remove bossbar just in case
bossbar set stardust:stardust_guardian players

# Decrement score of players in dungeon
scoreboard players remove #players_in_dungeon stardust.data 1

