
#> stardust:advancements/inventory_changed
#
# @executed	as the player & at current position
#
# @within	advancement stardust:technical/inventory_changed
#

# If has item magnet, add tag and score
execute if entity @s[tag=stardust.has_item_magnet] unless items entity @s weapon.offhand *[custom_data~{stardust:{"item_magnet":true}}] run function stardust:utils/magnet/removed
execute if entity @s[tag=!stardust.has_item_magnet] if items entity @s weapon.offhand *[custom_data~{stardust:{"item_magnet":true}}] run function stardust:utils/magnet/added

# Revoke advancement
advancement revoke @s only stardust:technical/inventory_changed

# Grant Legendarium full armor effect
scoreboard players set #success stardust.data 0
execute if items entity @s armor.head *[custom_data~{stardust:{"legendarium_helmet":true}}] if items entity @s armor.chest *[custom_data~{stardust:{"legendarium_chestplate":true}}] if items entity @s armor.legs *[custom_data~{stardust:{"legendarium_leggings":true}}] if items entity @s armor.feet *[custom_data~{stardust:{"legendarium_boots":true}}] run scoreboard players set #success stardust.data 1
execute if score #success stardust.data matches 1 if entity @s[tag=!stardust.legendarium_full_armor] run tag @s add stardust.legendarium_full_armor
execute if score #success stardust.data matches 0 if entity @s[tag=stardust.legendarium_full_armor] run tag @s remove stardust.legendarium_full_armor

# Grant Solarium full armor effect
scoreboard players set #success stardust.data 0
execute if items entity @s armor.head *[custom_data~{stardust:{"solarium_helmet":true}}] if items entity @s armor.chest *[custom_data~{stardust:{"solarium_chestplate":true}}] if items entity @s armor.legs *[custom_data~{stardust:{"solarium_leggings":true}}] if items entity @s armor.feet *[custom_data~{stardust:{"solarium_boots":true}}] run scoreboard players set #success stardust.data 1
execute if score #success stardust.data matches 1 if entity @s[tag=!stardust.solarium_full_armor] run tag @s add stardust.solarium_full_armor
execute if score #success stardust.data matches 0 if entity @s[tag=stardust.solarium_full_armor] run tag @s remove stardust.solarium_full_armor

# Grant Darkium full armor effect
scoreboard players set #success stardust.data 0
execute if items entity @s armor.head *[custom_data~{stardust:{"darkium_helmet":true}}] if items entity @s armor.chest *[custom_data~{stardust:{"darkium_chestplate":true}}] if items entity @s armor.legs *[custom_data~{stardust:{"darkium_leggings":true}}] if items entity @s armor.feet *[custom_data~{stardust:{"darkium_boots":true}}] run scoreboard players set #success stardust.data 1
execute if score #success stardust.data matches 1 if entity @s[tag=!stardust.darkium_full_armor] run tag @s add stardust.darkium_full_armor
execute if score #success stardust.data matches 0 if entity @s[tag=stardust.darkium_full_armor] run tag @s remove stardust.darkium_full_armor

