
advancement revoke @s only stardust:inventory_changed

# Storage define
data modify storage stardust:inventory all set from entity @s Inventory

# Inventory conditions
tag @s remove stardust.state.magnet
tag @s remove stardust.state.ultimate_elytra
tag @s remove stardust.state.solarium_set
execute if data storage stardust:inventory all[{Slot:-106b}].tag.stardust.item_magnet run tag @s add stardust.state.magnet
execute if data storage stardust:inventory all[{Slot:102b}].tag.stardust.ultimate_elytra run tag @s add stardust.state.ultimate_elytra
execute if data storage stardust:inventory all[{Slot:103b}].tag.stardust.solarium_helmet if data storage stardust:inventory all[{Slot:102b}].tag.stardust.solarium_chestplate if data storage stardust:inventory all[{Slot:101b}].tag.stardust.solarium_leggings if data storage stardust:inventory all[{Slot:100b}].tag.stardust.solarium_boots run tag @s add stardust.state.solarium_set

# Memory clean up
data remove storage stardust:inventory all

