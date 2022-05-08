
function simplenergy:generate/utils/random_position

scoreboard players set #max_attempts simplenergy.data 50
execute at @s run function simplenergy:generate/utils/find_adjacent_air

#Placing Ore
	execute at @s if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:place/awakened_stardust_ore/main
	execute at @s if block ~ ~ ~ #stardust:for_stardust_ore run scoreboard players add AwakenedStardustOreCount stardust.advanced_stats 1

kill @s
