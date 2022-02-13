
scoreboard players reset @s StardustFragment_Jump
effect give @s[nbt={SelectedItem:{tag:{StardustFragment_LegendarySword:1b}}}] minecraft:jump_boost 1 3 true
execute if entity @s[nbt={Inventory:[{Slot:-106b,tag:{StardustFragment_ItemMagnet:1b}}]}] run tp @e[type=item,distance=..4,tag=!global.ignore,tag=!global.ignore.pos,tag=!smithed.entity] ~ ~ ~
execute if entity @s[nbt={SelectedItem:{tag:{StardustFragment_TravelStaff:1b}}},scores={StardustFragment_Data=1..}] run particle minecraft:portal ~ ~ ~ 1 1 1 0 100
