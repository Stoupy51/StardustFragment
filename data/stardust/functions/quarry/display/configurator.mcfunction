execute store result score Qx1 stardust.data run data get entity @s SelectedItem.tag.stardust.quarry_x1
execute store result score Qy1 stardust.data run data get entity @s SelectedItem.tag.stardust.quarry_y1
execute store result score Qz1 stardust.data run data get entity @s SelectedItem.tag.stardust.quarry_z1
execute store result score Qx2 stardust.data run data get entity @s SelectedItem.tag.stardust.quarry_x2
execute store result score Qy2 stardust.data run data get entity @s SelectedItem.tag.stardust.quarry_y2
execute store result score Qz2 stardust.data run data get entity @s SelectedItem.tag.stardust.quarry_z2
summon area_effect_cloud ~ ~ ~ {Tags:["stardust.quarry_temp"]}
execute as @e[limit=1,tag=stardust.quarry_temp,distance=..1] at @s run function stardust:quarry/display/shulkers
