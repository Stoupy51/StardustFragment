
#> stardust:mobs/ultimate_dragon/try_boss_music
#
# @executed	as @a[distance=..200] & at @s
#
# @within	stardust:mobs/ultimate_dragon/second [ as @a[distance=..200] & at @s ]
#

## Choose music based on health
# Every end more than half health
playsound stardust:dimrain47_every_end record @s ~ ~ ~ 0.2
scoreboard players set @s stardust.boss_music 447

# The Ultimate Ascension at half health or less
# execute if score #health stardust.data matches ..512 run playsound stardust:stoupy_the_ultimate_ascension record @s ~ ~ ~ 0.2
# execute if score #health stardust.data matches ..512 run scoreboard players set @s stardust.boss_music THE_ULTIMATE_ASCENSION

# Add global seconds to boss music timer
scoreboard players operation @s stardust.boss_music += #global_second stardust.data

