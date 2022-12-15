
scoreboard players reset @s stardust.jump
effect give @s[nbt={SelectedItem:{tag:{stardust:{legendarium_sword:1b}}}}] jump_boost 1 3 true
execute if entity @s[tag=stardust.state.magnet] run tp @e[type=item,distance=..4,tag=!global.ignore,tag=!global.ignore.pos,tag=!smithed.entity] ~ ~ ~

