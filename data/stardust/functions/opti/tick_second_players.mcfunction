
effect give @s[nbt={Inventory:[{Slot:102b,tag:{stardust:{ultimate_elytra:1b}}}]}] minecraft:resistance 2 1 true
execute if score @s stardust.wormhole matches 1.. run function stardust:opti/wormhole_potion/use
attribute @s[tag=stardust.no_cooldown] minecraft:generic.attack_speed base set 2000
execute if entity @s[tag=!global.ignore.gui] at @s anchored eyes positioned ^ ^ ^2 run function stardust:visual/seed_status
forceload add -29999999 2013

#Dimensions
	scoreboard players add @s[scores={stardust.data=1..},nbt={SelectedItem:{tag:{stardust:{travel_staff:1b}}}}] stardust.data 10
	execute if score @s stardust.data matches 1.. run function stardust:dimensions/teleport
	tag @s[nbt={Dimension:"stardust:dungeon"}] add stardust.is_in_dungeon

#Life crystals
	scoreboard players set #success stardust.data 0
	execute store success score #success stardust.data run attribute @s minecraft:generic.max_health modifier value get 2013-0-0-0-0
	execute if score #success stardust.data matches 0 run function stardust:opti/update_health

#playsound remove tags
	tag @s remove stardust.ps.nether_star_generator
	tag @s remove stardust.ps.redstone_generator

