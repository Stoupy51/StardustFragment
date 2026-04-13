
#> stardust:mobs/ultimate_dragon/try_boss_music
#
# @executed	as @a[distance=..200] & at @s
#
# @within	stardust:mobs/ultimate_dragon/second [ as @a[distance=..200] & at @s ]
#

## Choose music based on health
# Prismatic Devastation more than half health
execute if score #health stardust.data matches 513.. run playsound stardust:stoupy_suno_prismatic_devastation record @s ~ ~ ~ 0.2
execute if score #health stardust.data matches 513.. run scoreboard players set @s stardust.boss_music 481

# The Ultimate Ascension at half health or less
execute if score #health stardust.data matches ..512 run playsound stardust:stoupy_suno_the_ultimate_ascension record @s ~ ~ ~ 0.2
execute if score #health stardust.data matches ..512 run scoreboard players set @s stardust.boss_music 364

# Add global seconds to boss music timer
scoreboard players operation @s stardust.boss_music += #global_second stardust.data

