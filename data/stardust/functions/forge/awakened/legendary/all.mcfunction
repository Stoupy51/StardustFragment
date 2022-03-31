
function stardust:forge/awakened/verif
#Select Craft
	execute if score temp stardust.data matches 2 as @e[type=item,nbt={Item:{tag:{stardust:{original_helmet:1b}}}},distance=..1,limit=1] run function stardust:forge/awakened/legendary/helmet
	execute if score temp stardust.data matches 2 as @e[type=item,nbt={Item:{tag:{stardust:{original_chestplate:1b}}}},distance=..1,limit=1] run function stardust:forge/awakened/legendary/chestplate
	execute if score temp stardust.data matches 2 as @e[type=item,nbt={Item:{tag:{stardust:{original_leggings:1b}}}},distance=..1,limit=1] run function stardust:forge/awakened/legendary/leggings
	execute if score temp stardust.data matches 2 as @e[type=item,nbt={Item:{tag:{stardust:{original_boots:1b}}}},distance=..1,limit=1] run function stardust:forge/awakened/legendary/boots
	execute if score temp stardust.data matches 2 as @e[type=item,nbt={Item:{tag:{stardust:{original_sword:1b}}}},distance=..1,limit=1] run function stardust:forge/awakened/legendary/sword
	execute if score temp stardust.data matches 2 as @e[type=item,nbt={Item:{tag:{stardust:{original_pickaxe:1b}}}},distance=..1,limit=1] run function stardust:forge/awakened/legendary/pickaxe
	execute if score temp stardust.data matches 2 as @e[type=item,nbt={Item:{tag:{stardust:{original_axe:1b}}}},distance=..1,limit=1] run function stardust:forge/awakened/legendary/axe
#tellraw @a {"score":{"name":"temp","objective":"stardust.data"}}
