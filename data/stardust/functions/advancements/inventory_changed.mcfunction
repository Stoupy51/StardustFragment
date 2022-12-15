
advancement revoke @s only stardust:inventory_changed

#Storage define
data modify storage stardust:main Inventory set from entity @s Inventory

#Inventory conditions
tag @s remove stardust.state.magnet
tag @s remove stardust.state.ultimate_elytra
tag @s remove stardust.state.solarium_set
execute if data storage stardust:main Inventory[{Slot:-106b}].tag.stardust.item_magnet run tag @s add stardust.state.magnet
execute if data storage stardust:main Inventory[{Slot:102b}].tag.stardust.ultimate_elytra run tag @s add stardust.state.ultimate_elytra
execute if data storage stardust:main Inventory[{Slot:103b}].tag.stardust.solarium_helmet if data storage stardust:main Inventory[{Slot:102b}].tag.stardust.solarium_chestplate if data storage stardust:main Inventory[{Slot:101b}].tag.stardust.solarium_leggings if data storage stardust:main Inventory[{Slot:100b}].tag.stardust.solarium_boots run tag @s add stardust.state.solarium_set

#Memory dump
data remove storage stardust:main Inventory

