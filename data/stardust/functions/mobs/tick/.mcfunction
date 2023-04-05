
#> stardust:mobs/tick/
#
# @within			stardust:tick
# @executed			as & at Model item display
#
# @description		Function executed every tick for every Stardust mob model
#

# Switch case on the model's death state
scoreboard players set #death stardust.data 0
execute store success score #death stardust.data if entity @s[tag=stardust.death_model]
execute if score #death stardust.data matches 0 run function stardust:mobs/tick/secondary
execute if score #death stardust.data matches 1 run function stardust:mobs/tick/death/

