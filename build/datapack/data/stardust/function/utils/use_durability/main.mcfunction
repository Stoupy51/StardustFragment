
#> stardust:utils/use_durability/main
#
# @executed	as the player & at current position
#
# @within	stardust:utils/snipers/right_click with storage stardust:temp input
#			stardust:utils/home_travel_staff/right_click {"amount":1,"max_damage":64,"item_model":"stardust:home_travel_staff"}
#
# @args		amount (int)
#			max_damage (int)
#			item_model (string)
#

# Compute durability usage (6 digits precision)
scoreboard players set #1000000 stardust.data 1000000
$scoreboard players set #temp_durability stardust.data -$(amount)
scoreboard players operation #temp_durability stardust.data *= #1000000 stardust.data
$scoreboard players set #temp_divider stardust.data $(max_damage)
scoreboard players operation #temp_durability stardust.data /= #temp_divider stardust.data
execute store result storage stardust:temp use_durability double 0.000001 run scoreboard players get #temp_durability stardust.data
function stardust:utils/use_durability/item_modifier with storage stardust:temp

# If item broke, destroy it
execute store result score #current_damage stardust.data run data get entity @s SelectedItem.components."minecraft:damage"
$execute if score #current_damage stardust.data matches $(max_damage).. anchored eyes run particle item{item:{id:"minecraft:stone",components:{"minecraft:item_model":"$(item_model)"}}} ^ ^ ^0.5 0 0 0 0.1 10
$execute if score #current_damage stardust.data matches $(max_damage).. run playsound minecraft:item.shield.break ambient @a[distance=..16]
$execute if score #current_damage stardust.data matches $(max_damage).. run item replace entity @s weapon with minecraft:air

