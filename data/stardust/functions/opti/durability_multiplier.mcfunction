
#Custom hurt durability for Damaged Stardust Armor & Tools
	scoreboard players set #durability_multiplier simplenergy.data 7000
	execute unless score @s simplenergy.head = #helmet simplenergy.data if data storage simplenergy:main durability[{Slot:103b,tag:{simplenergy:{damaged:1b}}}] run function simplenergy:opti/durability_multiplier/helmet
	execute unless score @s simplenergy.chest = #chestplate simplenergy.data if data storage simplenergy:main durability[{Slot:102b,tag:{simplenergy:{damaged:1b}}}] run function simplenergy:opti/durability_multiplier/chestplate
	execute unless score @s simplenergy.legs = #leggings simplenergy.data if data storage simplenergy:main durability[{Slot:101b,tag:{simplenergy:{damaged:1b}}}] run function simplenergy:opti/durability_multiplier/leggings
	execute unless score @s simplenergy.boots = #boots simplenergy.data if data storage simplenergy:main durability[{Slot:100b,tag:{simplenergy:{damaged:1b}}}] run function simplenergy:opti/durability_multiplier/boots
	scoreboard players set #durability_multiplier simplenergy.data 1200
	execute unless score @s simplenergy.offhand = #offhand simplenergy.data if data storage simplenergy:main durability[{Slot:-106b,tag:{simplenergy:{damaged:1b}}}] run function simplenergy:opti/durability_multiplier/offhand
	execute unless score @s simplenergy.mainhand = #mainhand simplenergy.data if data storage simplenergy:main durability[{Slot:-42b,tag:{simplenergy:{damaged:1b}}}] run function simplenergy:opti/durability_multiplier/mainhand

#Custom hurt durability for Reinforced Stardust Armor & Tools
	scoreboard players set #durability_multiplier simplenergy.data 10000
	execute unless score @s simplenergy.head = #helmet simplenergy.data if data storage simplenergy:main durability[{Slot:103b,tag:{simplenergy:{reinforced:1b}}}] run function simplenergy:opti/durability_multiplier/helmet
	execute unless score @s simplenergy.chest = #chestplate simplenergy.data if data storage simplenergy:main durability[{Slot:102b,tag:{simplenergy:{reinforced:1b}}}] run function simplenergy:opti/durability_multiplier/chestplate
	execute unless score @s simplenergy.legs = #leggings simplenergy.data if data storage simplenergy:main durability[{Slot:101b,tag:{simplenergy:{reinforced:1b}}}] run function simplenergy:opti/durability_multiplier/leggings
	execute unless score @s simplenergy.boots = #boots simplenergy.data if data storage simplenergy:main durability[{Slot:100b,tag:{simplenergy:{reinforced:1b}}}] run function simplenergy:opti/durability_multiplier/boots
	scoreboard players set #durability_multiplier simplenergy.data 1500
	execute unless score @s simplenergy.offhand = #offhand simplenergy.data if data storage simplenergy:main durability[{Slot:-106b,tag:{simplenergy:{reinforced:1b}}}] run function simplenergy:opti/durability_multiplier/offhand
	execute unless score @s simplenergy.mainhand = #mainhand simplenergy.data if data storage simplenergy:main durability[{Slot:-42b,tag:{simplenergy:{reinforced:1b}}}] run function simplenergy:opti/durability_multiplier/mainhand

#Custom hurt durability for Original Stardust & Elementary Armor & Tools
	scoreboard players set #durability_multiplier simplenergy.data 15000
	execute unless score @s simplenergy.head = #helmet simplenergy.data if data storage simplenergy:main durability[{Slot:103b,tag:{simplenergy:{original:1b}}}] run function simplenergy:opti/durability_multiplier/helmet
	execute unless score @s simplenergy.chest = #chestplate simplenergy.data if data storage simplenergy:main durability[{Slot:102b,tag:{simplenergy:{original:1b}}}] run function simplenergy:opti/durability_multiplier/chestplate
	execute unless score @s simplenergy.legs = #leggings simplenergy.data if data storage simplenergy:main durability[{Slot:101b,tag:{simplenergy:{original:1b}}}] run function simplenergy:opti/durability_multiplier/leggings
	execute unless score @s simplenergy.boots = #boots simplenergy.data if data storage simplenergy:main durability[{Slot:100b,tag:{simplenergy:{original:1b}}}] run function simplenergy:opti/durability_multiplier/boots
	scoreboard players set #durability_multiplier simplenergy.data 2000
	execute unless score @s simplenergy.offhand = #offhand simplenergy.data if data storage simplenergy:main durability[{Slot:-106b,tag:{simplenergy:{original:1b}}}] run function simplenergy:opti/durability_multiplier/offhand
	execute unless score @s simplenergy.mainhand = #mainhand simplenergy.data if data storage simplenergy:main durability[{Slot:-42b,tag:{simplenergy:{original:1b}}}] run function simplenergy:opti/durability_multiplier/mainhand
