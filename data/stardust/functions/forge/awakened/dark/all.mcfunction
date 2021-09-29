function stardust:forge/awakened/verif
#Select Craft
	execute if score Temp SF_Data matches 2 as @e[type=item,nbt={Item:{tag:{SF_OriginalHelmet:1s}}},distance=..1,limit=1] run function stardust:forge/awakened/dark/helmet
	execute if score Temp SF_Data matches 2 as @e[type=item,nbt={Item:{tag:{SF_OriginalChestplate:1s}}},distance=..1,limit=1] run function stardust:forge/awakened/dark/chestplate
	execute if score Temp SF_Data matches 2 as @e[type=item,nbt={Item:{tag:{SF_OriginalLeggings:1s}}},distance=..1,limit=1] run function stardust:forge/awakened/dark/leggings
	execute if score Temp SF_Data matches 2 as @e[type=item,nbt={Item:{tag:{SF_OriginalBoots:1s}}},distance=..1,limit=1] run function stardust:forge/awakened/dark/boots
	execute if score Temp SF_Data matches 2 as @e[type=item,nbt={Item:{tag:{SF_OriginalSword:1s}}},distance=..1,limit=1] run function stardust:forge/awakened/dark/sword
	execute if score Temp SF_Data matches 2 as @e[type=item,nbt={Item:{tag:{SF_OriginalPickaxe:1s}}},distance=..1,limit=1] run function stardust:forge/awakened/dark/pickaxe
	execute if score Temp SF_Data matches 2 as @e[type=item,nbt={Item:{tag:{SF_OriginalAxe:1s}}},distance=..1,limit=1] run function stardust:forge/awakened/dark/axe
#tellraw @a {"score":{"name":"Temp","objective":"SF_Data"}}
