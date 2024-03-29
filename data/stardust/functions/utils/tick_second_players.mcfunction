
#> stardust:utils/tick_second_players
#
# @within			stardust:tick_second
# @executed			as & at current player
#
# @description		Function executed every second for every player
#

# Inventory conditions
effect give @s[tag=stardust.state.ultimate_elytra] resistance 2 1 true
effect give @s[tag=stardust.state.solarium_set] fire_resistance 2 0 true

# Dimensions : Travel Staff use and portal teleportation
execute unless score TravelStaffDisabled stardust.config matches 1 run scoreboard players add @s[scores={stardust.data=1..},nbt={SelectedItem:{tag:{stardust:{travel_staff:1b}}}}] stardust.data 10
execute if entity @s[tag=stardust.teleported] run function stardust:dimensions/remove_teleported
execute if score @s stardust.data matches 1.. run function stardust:dimensions/teleport

# Optimisation trick, use a score to tell if a player is in the dungeon
execute if entity @s[tag=stardust.is_in_dungeon] run scoreboard players set #tick_dungeon stardust.data 1

# Playsound remove tags
tag @s remove stardust.ps.nether_star_generator
tag @s remove stardust.ps.redstone_generator

# Others : Attack speed, seed status, and forceload chunk
attribute @s[tag=stardust.no_cooldown] generic.attack_speed base set 2048
execute if entity @s[tag=!global.ignore.gui] at @s anchored eyes positioned ^ ^ ^2 run function stardust:visual/seed_status
forceload add -30000000 1600

