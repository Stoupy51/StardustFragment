function stardust:forge/awakened/verif
#Select Craft
	execute if score Temp StardustFragment_Data matches 2 as @e[type=item,nbt={Item:{tag:{StardustFragment_OriginalHelmet:1b}}},distance=..1,limit=1] run function stardust:forge/awakened/legendary/helmet
	execute if score Temp StardustFragment_Data matches 2 as @e[type=item,nbt={Item:{tag:{StardustFragment_OriginalChestplate:1b}}},distance=..1,limit=1] run function stardust:forge/awakened/legendary/chestplate
	execute if score Temp StardustFragment_Data matches 2 as @e[type=item,nbt={Item:{tag:{StardustFragment_OriginalLeggings:1b}}},distance=..1,limit=1] run function stardust:forge/awakened/legendary/leggings
	execute if score Temp StardustFragment_Data matches 2 as @e[type=item,nbt={Item:{tag:{StardustFragment_OriginalBoots:1b}}},distance=..1,limit=1] run function stardust:forge/awakened/legendary/boots
	execute if score Temp StardustFragment_Data matches 2 as @e[type=item,nbt={Item:{tag:{StardustFragment_OriginalSword:1b}}},distance=..1,limit=1] run function stardust:forge/awakened/legendary/sword
	execute if score Temp StardustFragment_Data matches 2 as @e[type=item,nbt={Item:{tag:{StardustFragment_OriginalPickaxe:1b}}},distance=..1,limit=1] run function stardust:forge/awakened/legendary/pickaxe
	execute if score Temp StardustFragment_Data matches 2 as @e[type=item,nbt={Item:{tag:{StardustFragment_OriginalAxe:1b}}},distance=..1,limit=1] run function stardust:forge/awakened/legendary/axe
#tellraw @a {"score":{"name":"Temp","objective":"StardustFragment_Data"}}
