
#Inventory conditions
	effect give @s[tag=stardust.state.ultimate_elytra] resistance 2 1 true
	effect give @s[tag=stardust.state.solarium_set] fire_resistance 2 0 true

#Dimensions
	execute unless score TravelStaffDisabled stardust.config matches 1 run scoreboard players add @s[scores={stardust.data=1..},nbt={SelectedItem:{tag:{stardust:{travel_staff:1b}}}}] stardust.data 10
	execute if entity @s[tag=stardust.teleported] run function stardust:dimensions/remove_teleported
	execute if score @s stardust.data matches 1.. run function stardust:dimensions/teleport
	tag @s[nbt={Dimension:"stardust:dungeon"}] add stardust.is_in_dungeon

#Life crystals
	execute unless score LifeCrystalDisabled stardust.config matches 1 run scoreboard players set #success stardust.data 0
	execute unless score LifeCrystalDisabled stardust.config matches 1 store success score #success stardust.data run attribute @s generic.max_health modifier value get 2013-0-0-0-0
	execute unless score LifeCrystalDisabled stardust.config matches 1 if score #success stardust.data matches 0 run function stardust:utils/update_health

#Playsound remove tags
	tag @s remove stardust.ps.nether_star_generator
	tag @s remove stardust.ps.redstone_generator

#Others
	execute if score @s stardust.wormhole matches 1.. run function stardust:right_click/wormhole_potion/use
	attribute @s[tag=stardust.no_cooldown] generic.attack_speed base set 2000
	execute if entity @s[tag=!global.ignore.gui] at @s anchored eyes positioned ^ ^ ^2 run function stardust:visual/seed_status
	forceload add -30000000 1600

