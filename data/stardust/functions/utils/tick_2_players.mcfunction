
scoreboard players reset @s stardust.jump
effect give @s[nbt={SelectedItem:{tag:{stardust:{legendarium_sword:1b}}}}] jump_boost 1 3 true
execute if data entity @s Inventory[{Slot:-106b}].tag.stardust.item_magnet run tp @e[type=item,distance=..4,tag=!global.ignore,tag=!global.ignore.pos,tag=!smithed.entity] ~ ~ ~
execute if score @s stardust.data matches 1.. if data entity @s SelectedItem.tag.stardust.travel_staff run particle portal ~ ~ ~ 1 1 1 0 100
