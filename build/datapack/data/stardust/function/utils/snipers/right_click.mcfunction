
#> stardust:utils/snipers/right_click
#
# @executed	as the player & at current position
#
# @within	stardust:advancements/right_click
#

# Stop if on cooldown
execute if score @s stardust.sniper_cooldown > #global_tick stardust.data run return fail

# Copy sniper data
data modify storage stardust:temp components set from entity @s SelectedItem.components
data modify storage stardust:temp sniper_data set from storage stardust:temp components."minecraft:custom_data".stardust.sniper

# Set cooldown
execute store result score @s stardust.sniper_cooldown run data get storage stardust:temp sniper_data.cooldown
scoreboard players operation @s stardust.sniper_cooldown += #global_tick stardust.data

# Get bullet damage
scoreboard players set #bullet_damage stardust.data 0
execute if score #bullet_damage stardust.data matches 0 if items entity @s container.* *[custom_data~{stardust:{darkium_fragment:true}}] run scoreboard players set #bullet_damage stardust.data 16
execute if score #bullet_damage stardust.data matches 0 if items entity @s container.* *[custom_data~{stardust:{solarium_fragment:true}}] run scoreboard players set #bullet_damage stardust.data 16
execute if score #bullet_damage stardust.data matches 0 if items entity @s container.* *[custom_data~{stardust:{legendarium_fragment:true}}] run scoreboard players set #bullet_damage stardust.data 16
execute if score #bullet_damage stardust.data matches 0 if items entity @s container.* *[custom_data~{stardust:{stardust_essence:true}}] run scoreboard players set #bullet_damage stardust.data 10
execute if score #bullet_damage stardust.data matches 0 if items entity @s container.* minecraft:gold_nugget run scoreboard players set #bullet_damage stardust.data 7
execute if score #bullet_damage stardust.data matches 0 if items entity @s container.* minecraft:iron_nugget run scoreboard players set #bullet_damage stardust.data 4
execute if score #bullet_damage stardust.data matches 0 if items entity @s container.* minecraft:copper_nugget run scoreboard players set #bullet_damage stardust.data 1
execute if score #bullet_damage stardust.data matches 16 run advancement grant @s only stardust:visible/stuff/bullets/darkium_fragment
execute if score #bullet_damage stardust.data matches 16 run advancement grant @s only stardust:visible/stuff/bullets/solarium_fragment
execute if score #bullet_damage stardust.data matches 16 run advancement grant @s only stardust:visible/stuff/bullets/legendarium_fragment
execute if score #bullet_damage stardust.data matches 10 run advancement grant @s only stardust:visible/stuff/bullets/stardust_essence
execute if score #bullet_damage stardust.data matches 7 run advancement grant @s only stardust:visible/stuff/bullets/gold_nugget
execute if score #bullet_damage stardust.data matches 4 run advancement grant @s only stardust:visible/stuff/bullets/iron_nugget
execute if score #bullet_damage stardust.data matches 1 run advancement grant @s only stardust:visible/stuff/bullets/copper_nugget
execute if score #bullet_damage stardust.data matches 16 unless entity @s[gamemode=creative] run clear @s *[custom_data~{stardust:{darkium_fragment:true}}] 1
execute if score #bullet_damage stardust.data matches 16 unless entity @s[gamemode=creative] run clear @s *[custom_data~{stardust:{solarium_fragment:true}}] 1
execute if score #bullet_damage stardust.data matches 16 unless entity @s[gamemode=creative] run clear @s *[custom_data~{stardust:{legendarium_fragment:true}}] 1
execute if score #bullet_damage stardust.data matches 10 unless entity @s[gamemode=creative] run clear @s *[custom_data~{stardust:{stardust_essence:true}}] 1
execute if score #bullet_damage stardust.data matches 7 unless entity @s[gamemode=creative] run clear @s minecraft:gold_nugget 1
execute if score #bullet_damage stardust.data matches 4 unless entity @s[gamemode=creative] run clear @s minecraft:iron_nugget 1
execute if score #bullet_damage stardust.data matches 1 unless entity @s[gamemode=creative] run clear @s minecraft:copper_nugget 1
execute if score #bullet_damage stardust.data matches 0 if entity @s[gamemode=creative] run scoreboard players set #bullet_damage stardust.data 1
execute if score #bullet_damage stardust.data matches 0 run return run playsound minecraft:block.note_block.didgeridoo ambient @s

# Use 1 durability
data modify storage stardust:temp input set value {"amount":1,"max_damage":1,"item_model":""}
data modify storage stardust:temp input.max_damage set from storage stardust:temp components."minecraft:max_damage"
data modify storage stardust:temp input.item_model set from storage stardust:temp components."minecraft:item_model"
function stardust:utils/use_durability/main with storage stardust:temp input

# Shoot bullet entity
tag @s add stardust.shooter
function stardust:utils/snipers/raycast_in_your_ass with storage stardust:temp sniper_data
tag @s remove stardust.shooter

