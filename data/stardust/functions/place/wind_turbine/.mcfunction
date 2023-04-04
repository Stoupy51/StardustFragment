
setblock ~ ~ ~ iron_trapdoor
scoreboard players set #success stardust.data 0
execute store success score #success stardust.data if entity @s[y_rotation=-46..45] run setblock ~ ~ ~ iron_trapdoor[facing=north]
execute if score #success stardust.data matches 0 store success score #success stardust.data if entity @s[y_rotation=45..135] run setblock ~ ~ ~ iron_trapdoor[facing=east]
execute if score #success stardust.data matches 0 store success score #success stardust.data if entity @s[y_rotation=135..225] run setblock ~ ~ ~ iron_trapdoor[facing=south]
execute if score #success stardust.data matches 0 store success score #success stardust.data if entity @s[y_rotation=225..315] run setblock ~ ~ ~ iron_trapdoor[facing=west]

execute align xyz positioned ~.5 ~.5 ~.5 summon item_display at @s run function stardust:place/wind_turbine/secondary

