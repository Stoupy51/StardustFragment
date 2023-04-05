
#> stardust:dimensions/end/all
#
# @within			stardust:load/dimensions
# @executed			as & at a random player
#
# @description		Teleport a player to the end dimension and schedule the function to teleport back the player
#					This prevents end portal issues (Non-spawning portal)
#

# Add temporary tag to the player to be able to find it later (teleport back)
tag @s add stardust.temp

# Forceload the chunk (score #chunk stardust.data to 0 if not already done)
execute store result score #chunk stardust.data run forceload query ~ ~
execute if score #chunk stardust.data matches 0 run forceload add ~ ~

# Summon temporary marker to be able to teleport back the player later
summon marker ~ ~ ~ {Tags:["stardust.load_end","global.ignore","global.ignore.kill"]}

# Teleport the player to the end with slow falling effect
execute in the_end run tp @s 0 69 0
effect give @s slow_falling 2 255 true

# Schedule the function to teleport back the player
schedule function stardust:dimensions/end/done 2s replace

