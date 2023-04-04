
setblock ~ ~ ~ glass
execute if entity @s[y_rotation=-46..45] run scoreboard players set #send_rotation stardust.data 1
execute if entity @s[y_rotation=45..135] run scoreboard players set #send_rotation stardust.data 2
execute if entity @s[y_rotation=135..225] run scoreboard players set #send_rotation stardust.data 3
execute if entity @s[y_rotation=225..315] run scoreboard players set #send_rotation stardust.data 4
execute align xyz positioned ~.5 ~.5 ~.5 summon item_display at @s run function stardust:place/life_crystal/secondary

