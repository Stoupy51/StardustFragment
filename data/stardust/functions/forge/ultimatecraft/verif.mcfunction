scoreboard players reset * x
#Structure Orientation
	execute if block ~-2 ~-2 ~-2 diamond_block if block ~-2 ~-1 ~-2 iron_block if block ~2 ~-2 ~-2 emerald_block if block ~2 ~-1 ~-2 coal_block if block ~2 ~-2 ~2 quartz_block if block ~2 ~-1 ~2 redstone_block if block ~-2 ~-2 ~2 gold_block if block ~-2 ~-1 ~2 lapis_block run scoreboard players add @s SF_X 1
	execute if block ~2 ~-2 ~2 diamond_block if block ~2 ~-1 ~2 iron_block if block ~-2 ~-2 ~2 emerald_block if block ~-2 ~-1 ~2 coal_block if block ~-2 ~-2 ~-2 quartz_block if block ~-2 ~-1 ~-2 redstone_block if block ~2 ~-2 ~-2 gold_block if block ~2 ~-1 ~-2 lapis_block run scoreboard players add @s SF_X 1
	execute if block ~2 ~-2 ~-2 diamond_block if block ~2 ~-1 ~-2 iron_block if block ~2 ~-2 ~2 emerald_block if block ~2 ~-1 ~2 coal_block if block ~-2 ~-2 ~2 quartz_block if block ~-2 ~-1 ~2 redstone_block if block ~-2 ~-2 ~-2 gold_block if block ~-2 ~-1 ~-2 lapis_block run scoreboard players add @s SF_X 1
	execute if block ~-2 ~-2 ~2 diamond_block if block ~-2 ~-1 ~2 iron_block if block ~-2 ~-2 ~-2 emerald_block if block ~-2 ~-1 ~-2 coal_block if block ~2 ~-2 ~-2 quartz_block if block ~2 ~-1 ~-2 redstone_block if block ~2 ~-2 ~2 gold_block if block ~2 ~-1 ~2 lapis_block run scoreboard players add @s SF_X 1

#Next of the structure
	execute if score @s SF_X matches 1 if block ~ ~-1 ~ netherite_block if block ~2 ~ ~2 white_stained_glass if block ~-2 ~ ~-2 white_stained_glass if block ~-2 ~ ~2 white_stained_glass if block ~2 ~ ~-2 white_stained_glass if block ~ ~-2 ~ white_concrete if block ~1 ~-1 ~1 dragon_egg if block ~-1 ~-1 ~-1 dragon_egg if block ~-1 ~-1 ~1 dragon_egg if block ~1 ~-1 ~-1 dragon_egg if block ~2 ~-2 ~ beacon if block ~ ~-2 ~2 beacon if block ~-2 ~-2 ~ beacon if block ~ ~-2 ~-2 beacon if block ~1 ~-2 ~ white_concrete if block ~-1 ~-2 ~ white_concrete if block ~ ~-2 ~1 white_concrete if block ~ ~-2 ~-1 white_concrete if block ~1 ~-2 ~1 white_concrete if block ~-1 ~-2 ~1 white_concrete if block ~-1 ~-2 ~-1 white_concrete if block ~1 ~-2 ~-1 white_concrete if block ~1 ~-2 ~2 black_concrete if block ~-1 ~-2 ~2 black_concrete if block ~1 ~-2 ~-2 black_concrete if block ~-1 ~-2 ~-2 black_concrete if block ~2 ~-2 ~1 black_concrete if block ~-2 ~-2 ~1 black_concrete if block ~2 ~-2 ~-1 black_concrete if block ~-2 ~-2 ~-1 black_concrete run scoreboard players add @s SF_X 1
