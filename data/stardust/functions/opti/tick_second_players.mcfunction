
execute unless predicate stardust:in_ultimate unless predicate stardust:in_dungeon run function stardust:generate/player
effect give @s[nbt={Inventory:[{Slot:102b,tag:{StardustFragment_UltimateElytra:1b}}]}] minecraft:resistance 2 1 true
execute if score @s StardustFragment_Wormhole matches 1.. run function stardust:opti/wormhole_potion/use
attribute @s[tag=StardustFragment_NoCooldown] minecraft:generic.attack_speed base set 2000
execute if entity @s[tag=!global.ignore.gui] at @s anchored eyes positioned ^ ^ ^2 run function stardust:visual/seed_status
forceload add -29999999 2013

#Dimensions
	scoreboard players add @s[scores={StardustFragment_Data=1..},nbt={SelectedItem:{tag:{StardustFragment_TravelStaff:1b}}}] StardustFragment_Data 10
	execute if score @s StardustFragment_Data matches 1.. run function stardust:dimensions/teleport
	tag @s[nbt={Dimension:"stardust:dungeon"}] add StardustFragment_IsInDungeon
