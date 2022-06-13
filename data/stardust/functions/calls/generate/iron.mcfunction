
function simplenergy:generate/utils/random_position

scoreboard players set #max_attempts simplenergy.data 5
execute at @s run function simplenergy:generate/utils/find_adjacent_air

#Placing Ore
	execute at @s if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/iron_type
	execute at @s positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/iron_type
	execute at @s positioned ~0.0 ~0.5 ~0.5 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/iron_type
	execute at @s positioned ~0.5 ~0.5 ~0.0 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/iron_type
	execute at @s positioned ~0.5 ~0.0 ~0.5 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/iron_type
	execute at @s positioned ~0.0 ~0.5 ~0.0 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/iron_type
	execute at @s positioned ~1.0 ~1.0 ~1.0 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/iron_type
	execute at @s positioned ~0.0 ~1.0 ~1.0 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/iron_type
	execute at @s positioned ~1.0 ~1.0 ~0.0 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/iron_type
	execute at @s positioned ~1.0 ~0.0 ~1.0 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/iron_type
	execute at @s positioned ~0.0 ~1.0 ~0.0 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/iron_type
	execute at @s positioned ~1.5 ~1.5 ~1.5 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/iron_type
	execute at @s positioned ~0.0 ~1.5 ~1.5 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/iron_type
	execute at @s positioned ~1.5 ~1.5 ~0.0 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/iron_type
	execute at @s positioned ~1.5 ~0.0 ~1.5 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/iron_type
	execute at @s positioned ~0.0 ~1.5 ~0.0 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/iron_type
	execute at @s positioned ~2.0 ~2.0 ~2.0 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/iron_type
	execute at @s positioned ~0.0 ~2.0 ~2.0 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/iron_type
	execute at @s positioned ~2.0 ~2.0 ~0.0 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/iron_type
	execute at @s positioned ~2.0 ~0.0 ~2.0 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/iron_type
	execute at @s positioned ~0.0 ~2.0 ~0.0 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/iron_type
	execute at @s positioned ~2.5 ~2.5 ~2.5 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/iron_type
	execute at @s positioned ~0.0 ~2.5 ~2.5 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/iron_type
	execute at @s positioned ~2.5 ~2.5 ~0.0 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/iron_type
	execute at @s positioned ~2.5 ~0.0 ~2.5 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/iron_type
	execute at @s positioned ~0.0 ~2.5 ~0.0 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/iron_type
	execute at @s positioned ~3.0 ~3.0 ~3.0 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/iron_type
	execute at @s positioned ~0.0 ~3.0 ~3.0 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/iron_type
	execute at @s positioned ~3.0 ~3.0 ~0.0 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/iron_type
	execute at @s positioned ~3.0 ~0.0 ~3.0 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/iron_type
	execute at @s positioned ~0.0 ~3.0 ~0.0 if block ~ ~ ~ #stardust:for_stardust_ore run function stardust:calls/generate/iron_type

kill @s
