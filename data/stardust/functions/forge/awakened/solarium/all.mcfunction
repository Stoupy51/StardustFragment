
function stardust:forge/awakened/verif
#Select Craft
	execute if score #temp stardust.data matches 2 as @e[type=item,nbt={Item:{tag:{stardust:{original_helmet:1b}}}},distance=..1,limit=1] run function stardust:forge/awakened/solarium/helmet
	execute if score #temp stardust.data matches 2 as @e[type=item,nbt={Item:{tag:{stardust:{original_chestplate:1b}}}},distance=..1,limit=1] run function stardust:forge/awakened/solarium/chestplate
	execute if score #temp stardust.data matches 2 as @e[type=item,nbt={Item:{tag:{stardust:{original_leggings:1b}}}},distance=..1,limit=1] run function stardust:forge/awakened/solarium/leggings
	execute if score #temp stardust.data matches 2 as @e[type=item,nbt={Item:{tag:{stardust:{original_boots:1b}}}},distance=..1,limit=1] run function stardust:forge/awakened/solarium/boots
	execute if score #temp stardust.data matches 2 as @e[type=item,nbt={Item:{tag:{stardust:{original_sword:1b}}}},distance=..1,limit=1] run function stardust:forge/awakened/solarium/sword
	execute if score #temp stardust.data matches 2 as @e[type=item,nbt={Item:{tag:{stardust:{original_pickaxe:1b}}}},distance=..1,limit=1] run function stardust:forge/awakened/solarium/pickaxe
	execute if score #temp stardust.data matches 2 as @e[type=item,nbt={Item:{tag:{stardust:{original_axe:1b}}}},distance=..1,limit=1] run function stardust:forge/awakened/solarium/axe
#tellraw @a {"score":{"name":"#temp","objective":"stardust.data"}}
