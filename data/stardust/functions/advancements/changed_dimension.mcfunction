
advancement revoke @s only stardust:changed_dimension

# Pre-conditions
execute as @a[tag=stardust.is_in_dungeon] unless entity @s[nbt={Dimension:"stardust:dungeon"}] run gamemode survival @s[gamemode=adventure]
	
# Tags remove
tag @s remove stardust.is_in_dungeon

# Dimensions conditions
tag @s[nbt={Dimension:"stardust:dungeon"}] add stardust.is_in_dungeon
execute store result score #in_stardust_dimension stardust.data if entity @a[predicate=stardust:in_dim/stardust]

# Results
gamemode adventure @s[gamemode=survival,tag=stardust.is_in_dungeon]

