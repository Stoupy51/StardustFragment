
#Custom hurt durability for Damaged Stardust Armor
	scoreboard players set #durability_multiplier simplenergy.data 7
	execute unless score @s simplenergy.head = #helmet simplenergy.data if data storage simplenergy:items temp[{Slot:103b,tag:{stardust:{damaged:1b}}}] run function simplenergy:opti/hurt/helmet
	execute unless score @s simplenergy.chest = #chestplate simplenergy.data if data storage simplenergy:items temp[{Slot:102b,tag:{stardust:{damaged:1b}}}] run function simplenergy:opti/hurt/chestplate
	execute unless score @s simplenergy.legs = #leggings simplenergy.data if data storage simplenergy:items temp[{Slot:101b,tag:{stardust:{damaged:1b}}}] run function simplenergy:opti/hurt/leggings
	execute unless score @s simplenergy.boots = #boots simplenergy.data if data storage simplenergy:items temp[{Slot:100b,tag:{stardust:{damaged:1b}}}] run function simplenergy:opti/hurt/boots

#Custom hurt durability for Reinforced Stardust Armor
	scoreboard players set #durability_multiplier simplenergy.data 10
	execute unless score @s simplenergy.head = #helmet simplenergy.data if data storage simplenergy:items temp[{Slot:103b,tag:{stardust:{reinforced:1b}}}] run function simplenergy:opti/hurt/helmet
	execute unless score @s simplenergy.chest = #chestplate simplenergy.data if data storage simplenergy:items temp[{Slot:102b,tag:{stardust:{reinforced:1b}}}] run function simplenergy:opti/hurt/chestplate
	execute unless score @s simplenergy.legs = #leggings simplenergy.data if data storage simplenergy:items temp[{Slot:101b,tag:{stardust:{reinforced:1b}}}] run function simplenergy:opti/hurt/leggings
	execute unless score @s simplenergy.boots = #boots simplenergy.data if data storage simplenergy:items temp[{Slot:100b,tag:{stardust:{reinforced:1b}}}] run function simplenergy:opti/hurt/boots

#Custom hurt durability for Original Stardust & Elementary Armor
	scoreboard players set #durability_multiplier simplenergy.data 15
	execute unless score @s simplenergy.head = #helmet simplenergy.data if data storage simplenergy:items temp[{Slot:103b,tag:{stardust:{original:1b}}}] run function simplenergy:opti/hurt/helmet
	execute unless score @s simplenergy.chest = #chestplate simplenergy.data if data storage simplenergy:items temp[{Slot:102b,tag:{stardust:{original:1b}}}] run function simplenergy:opti/hurt/chestplate
	execute unless score @s simplenergy.legs = #leggings simplenergy.data if data storage simplenergy:items temp[{Slot:101b,tag:{stardust:{original:1b}}}] run function simplenergy:opti/hurt/leggings
	execute unless score @s simplenergy.boots = #boots simplenergy.data if data storage simplenergy:items temp[{Slot:100b,tag:{stardust:{original:1b}}}] run function simplenergy:opti/hurt/boots
