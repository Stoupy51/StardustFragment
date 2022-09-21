
function simplenergy:generate/utils/random_position

scoreboard players set #max_attempts simplenergy.data 50
function simplenergy:generate/utils/find_adjacent_air

#Placing Ore
	execute at @s if score #pos_y simplenergy.data matches 0..1500 if block ~ ~ ~ #stardust:for_stardust_ore run scoreboard players add AwakenedStardustOreCount stardust.advanced_stats 1
	execute at @s if score #pos_y simplenergy.data matches 0..1500 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:place/awakened_stardust_ore/

kill @s
