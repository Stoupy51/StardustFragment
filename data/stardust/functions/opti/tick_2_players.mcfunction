
scoreboard players reset @s stardust.jump
effect give @s[nbt={SelectedItem:{tag:{stardust:{legendary_sword:1b}}}}] minecraft:jump_boost 1 3 true
execute if entity @s[nbt={Inventory:[{Slot:-106b,tag:{stardust:{item_magnet:1b}}}]}] run tp @e[type=item,distance=..4,tag=!global.ignore,tag=!global.ignore.pos,tag=!smithed.entity] ~ ~ ~
execute if entity @s[nbt={SelectedItem:{tag:{stardust:{travel_staff:1b}}}},scores={stardust.data=1..}] run particle portal ~ ~ ~ 1 1 1 0 100
