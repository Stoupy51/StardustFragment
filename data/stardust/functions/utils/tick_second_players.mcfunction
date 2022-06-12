
data modify storage stardust:main Inventory set from entity @s Inventory

#Inventory conditions
	execute if data storage stardust:main Inventory[{Slot:102b,tag:{stardust:{ultimate_elytra:1b}}}] run effect give @s resistance 2 1 true
	execute if data storage stardust:main Inventory[{Slot:103b,tag:{stardust:{solarium_helmet:1b}}}] run effect give @s fire_resistance 2 0 true
	execute if data storage stardust:main Inventory[{Slot:102b,tag:{stardust:{solarium_chestplate:1b}}}] run effect give @s fire_resistance 2 0 true
	execute if data storage stardust:main Inventory[{Slot:101b,tag:{stardust:{solarium_leggings:1b}}}] run effect give @s fire_resistance 2 0 true
	execute if data storage stardust:main Inventory[{Slot:100b,tag:{stardust:{solarium_boots:1b}}}] run effect give @s fire_resistance 2 0 true

#Dimensions
	scoreboard players add @s[scores={stardust.data=1..},nbt={SelectedItem:{tag:{stardust:{travel_staff:1b}}}}] stardust.data 10
	execute if score @s stardust.data matches 1.. run function stardust:dimensions/teleport
	tag @s[nbt={Dimension:"stardust:dungeon"}] add stardust.is_in_dungeon

#Life crystals
	scoreboard players set #success stardust.data 0
	execute store success score #success stardust.data run attribute @s generic.max_health modifier value get 2013-0-0-0-0
	execute if score #success stardust.data matches 0 run function stardust:utils/update_health

#Playsound remove tags
	tag @s remove stardust.ps.nether_star_generator
	tag @s remove stardust.ps.redstone_generator

#Others
	execute if score @s stardust.wormhole matches 1.. run function stardust:utils/wormhole_potion/use
	attribute @s[tag=stardust.no_cooldown] generic.attack_speed base set 2000
	execute if entity @s[tag=!global.ignore.gui] at @s anchored eyes positioned ^ ^ ^2 run function stardust:visual/seed_status
	forceload add -30000000 1600

#Memory dump
data remove storage stardust:main Inventory
