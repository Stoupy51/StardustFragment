
#> stardust:mobs/stardust_pillar/try_boss_music
#
# @executed	as @a[distance=..200] & at @s
#
# @within	stardust:mobs/stardust_pillar/second [ as @a[distance=..200] & at @s ]
#

## Choose music based on health
# Space Battle, if shield active
execute if score #health stardust.data matches 251.. run playsound stardust:f_777_space_battle record @s ~ ~ ~ 0.2
execute if score #health stardust.data matches 251.. run scoreboard players set @s stardust.boss_music 323

# Gravity, if shield down
execute if score #health stardust.data matches ..250 run playsound stardust:shut_eye_gravity record @s ~ ~ ~ 0.2
execute if score #health stardust.data matches ..250 run scoreboard players set @s stardust.boss_music 255

# Add global seconds to boss music timer
scoreboard players operation @s stardust.boss_music += #global_second stardust.data

