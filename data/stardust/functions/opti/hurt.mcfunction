
#Custom hurt durability for Damaged Stardust Armor
	scoreboard players set DurabilityMultiplier SimplEnergy_Data 7
	execute unless score @s SimplEnergy_HelmetDurability = Helmet SimplEnergy_Data if data storage simplenergy:items all.Temp[{Slot:103b,tag:{StardustFragment_Damaged:1b}}] run function simplenergy:opti/hurt/helmet
	execute unless score @s SimplEnergy_ChestplateDurability = Chestplate SimplEnergy_Data if data storage simplenergy:items all.Temp[{Slot:102b,tag:{StardustFragment_Damaged:1b}}] run function simplenergy:opti/hurt/chestplate
	execute unless score @s SimplEnergy_LeggingsDurability = Leggings SimplEnergy_Data if data storage simplenergy:items all.Temp[{Slot:101b,tag:{StardustFragment_Damaged:1b}}] run function simplenergy:opti/hurt/leggings
	execute unless score @s SimplEnergy_BootsDurability = Boots SimplEnergy_Data if data storage simplenergy:items all.Temp[{Slot:100b,tag:{StardustFragment_Damaged:1b}}] run function simplenergy:opti/hurt/boots

#Custom hurt durability for Reinforced Stardust Armor
	scoreboard players set DurabilityMultiplier SimplEnergy_Data 10
	execute unless score @s SimplEnergy_HelmetDurability = Helmet SimplEnergy_Data if data storage simplenergy:items all.Temp[{Slot:103b,tag:{StardustFragment_Reinforced:1b}}] run function simplenergy:opti/hurt/helmet
	execute unless score @s SimplEnergy_ChestplateDurability = Chestplate SimplEnergy_Data if data storage simplenergy:items all.Temp[{Slot:102b,tag:{StardustFragment_Reinforced:1b}}] run function simplenergy:opti/hurt/chestplate
	execute unless score @s SimplEnergy_LeggingsDurability = Leggings SimplEnergy_Data if data storage simplenergy:items all.Temp[{Slot:101b,tag:{StardustFragment_Reinforced:1b}}] run function simplenergy:opti/hurt/leggings
	execute unless score @s SimplEnergy_BootsDurability = Boots SimplEnergy_Data if data storage simplenergy:items all.Temp[{Slot:100b,tag:{StardustFragment_Reinforced:1b}}] run function simplenergy:opti/hurt/boots

#Custom hurt durability for Original Stardust & Elementary Armor
	scoreboard players set DurabilityMultiplier SimplEnergy_Data 15
	execute unless score @s SimplEnergy_HelmetDurability = Helmet SimplEnergy_Data if data storage simplenergy:items all.Temp[{Slot:103b,tag:{StardustFragment_Original:1b}}] run function simplenergy:opti/hurt/helmet
	execute unless score @s SimplEnergy_ChestplateDurability = Chestplate SimplEnergy_Data if data storage simplenergy:items all.Temp[{Slot:102b,tag:{StardustFragment_Original:1b}}] run function simplenergy:opti/hurt/chestplate
	execute unless score @s SimplEnergy_LeggingsDurability = Leggings SimplEnergy_Data if data storage simplenergy:items all.Temp[{Slot:101b,tag:{StardustFragment_Original:1b}}] run function simplenergy:opti/hurt/leggings
	execute unless score @s SimplEnergy_BootsDurability = Boots SimplEnergy_Data if data storage simplenergy:items all.Temp[{Slot:100b,tag:{StardustFragment_Original:1b}}] run function simplenergy:opti/hurt/boots
