
function simplenergy:generate/utils/random_position

scoreboard players set #max_attempts simplenergy.data 50
function simplenergy:generate/utils/find_adjacent_air

#Placing Ore
	execute at @s if block ~ ~ ~ #stardust:for_stardust_ore run function simplenergy:place/simplunium_ore/main
	execute at @s positioned ~0.8 ~0.8 ~0.8 if block ~ ~ ~ #stardust:for_stardust_ore run function simplenergy:place/simplunium_ore/main
	execute at @s positioned ~0.0 ~0.8 ~0.8 if block ~ ~ ~ #stardust:for_stardust_ore run function simplenergy:place/simplunium_ore/main
	execute at @s positioned ~0.8 ~0.8 ~0.0 if block ~ ~ ~ #stardust:for_stardust_ore run function simplenergy:place/simplunium_ore/main
	execute at @s positioned ~0.8 ~0.0 ~0.8 if block ~ ~ ~ #stardust:for_stardust_ore run function simplenergy:place/simplunium_ore/main
	execute at @s positioned ~0.0 ~0.8 ~0.0 if block ~ ~ ~ #stardust:for_stardust_ore run function simplenergy:place/simplunium_ore/main

kill @s
