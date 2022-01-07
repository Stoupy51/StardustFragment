function stardust:forge/awakened/verif
#Select Craft
	execute if score Temp StardustFragment_Data matches 2 as @e[type=item,nbt={Item:{tag:{StardustFragment_OriginalHelmet:1b}}},distance=..1,limit=1] run function stardust:forge/awakened/solar/helmet
	execute if score Temp StardustFragment_Data matches 2 as @e[type=item,nbt={Item:{tag:{StardustFragment_OriginalChestplate:1b}}},distance=..1,limit=1] run function stardust:forge/awakened/solar/chestplate
	execute if score Temp StardustFragment_Data matches 2 as @e[type=item,nbt={Item:{tag:{StardustFragment_OriginalLeggings:1b}}},distance=..1,limit=1] run function stardust:forge/awakened/solar/leggings
	execute if score Temp StardustFragment_Data matches 2 as @e[type=item,nbt={Item:{tag:{StardustFragment_OriginalBoots:1b}}},distance=..1,limit=1] run function stardust:forge/awakened/solar/boots
	execute if score Temp StardustFragment_Data matches 2 as @e[type=item,nbt={Item:{tag:{StardustFragment_OriginalSword:1b}}},distance=..1,limit=1] run function stardust:forge/awakened/solar/sword
	execute if score Temp StardustFragment_Data matches 2 as @e[type=item,nbt={Item:{tag:{StardustFragment_OriginalPickaxe:1b}}},distance=..1,limit=1] run function stardust:forge/awakened/solar/pickaxe
	execute if score Temp StardustFragment_Data matches 2 as @e[type=item,nbt={Item:{tag:{StardustFragment_OriginalAxe:1b}}},distance=..1,limit=1] run function stardust:forge/awakened/solar/axe
#tellraw @a {"score":{"name":"Temp","objective":"StardustFragment_Data"}}
