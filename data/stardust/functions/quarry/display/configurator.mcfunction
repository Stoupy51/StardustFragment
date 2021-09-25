execute store result score Qx1 SF_Data run data get entity @s SelectedItem.tag.SF_Qx1
execute store result score Qy1 SF_Data run data get entity @s SelectedItem.tag.SF_Qy1
execute store result score Qz1 SF_Data run data get entity @s SelectedItem.tag.SF_Qz1
execute store result score Qx2 SF_Data run data get entity @s SelectedItem.tag.SF_Qx2
execute store result score Qy2 SF_Data run data get entity @s SelectedItem.tag.SF_Qy2
execute store result score Qz2 SF_Data run data get entity @s SelectedItem.tag.SF_Qz2
summon area_effect_cloud ~ ~ ~ {Tags:["SF_QuarryTemp"]}
execute as @e[type=area_effect_cloud,limit=1,tag=SF_QuarryTemp,distance=..1] at @s run function stardust:quarry/display/shulkers
