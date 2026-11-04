# @template stardust_test:room
# @environment stardust_test:loaded
# @dummy ~ ~ ~
# @timeout 300
await score #stardust.loaded load.status matches 1

loot replace entity @s weapon.mainhand loot stardust:i/life_crystal
scoreboard players set @s stardust.cooldown 0
scoreboard players set @s stardust.life_crystal 20
execute at @s run function stardust:advancements/use_life_crystal

assert score @s stardust.life_crystal matches 20
assert chat "maximum number of Life Crystals" @s
assert result 1 run clear @s *[custom_data~{stardust:{life_crystal:true}}] 0