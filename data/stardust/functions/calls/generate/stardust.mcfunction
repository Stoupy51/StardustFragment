
function simplenergy:generate/utils/random_position

scoreboard players set #max_attempts simplenergy.data 50
function simplenergy:generate/utils/find_adjacent_air

#Placing Ore
	execute at @s if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/stardust_type
	execute at @s positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/stardust_type
	execute at @s positioned ~ ~0.5 ~0.5 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/stardust_type
	execute at @s positioned ~0.5 ~0.5 ~ if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/stardust_type
	execute at @s positioned ~0.5 ~ ~0.5 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/stardust_type
	execute at @s positioned ~ ~0.5 ~ if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/stardust_type

kill @s
