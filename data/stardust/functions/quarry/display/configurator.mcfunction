execute store result score Qx1 StardustFragment_Data run data get entity @s SelectedItem.tag.StardustFragment_Qx1
execute store result score Qy1 StardustFragment_Data run data get entity @s SelectedItem.tag.StardustFragment_Qy1
execute store result score Qz1 StardustFragment_Data run data get entity @s SelectedItem.tag.StardustFragment_Qz1
execute store result score Qx2 StardustFragment_Data run data get entity @s SelectedItem.tag.StardustFragment_Qx2
execute store result score Qy2 StardustFragment_Data run data get entity @s SelectedItem.tag.StardustFragment_Qy2
execute store result score Qz2 StardustFragment_Data run data get entity @s SelectedItem.tag.StardustFragment_Qz2
summon area_effect_cloud ~ ~ ~ {Tags:["StardustFragment_QuarryTemp"]}
execute as @e[type=area_effect_cloud,limit=1,tag=StardustFragment_QuarryTemp,distance=..1] at @s run function stardust:quarry/display/shulkers
