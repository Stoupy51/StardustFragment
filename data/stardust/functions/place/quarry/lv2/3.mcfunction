scoreboard players set @s energy.max_storage 60000
scoreboard players operation @s energy.transfer_rate = @s energy.max_storage
execute store result score @s energy.storage run data get entity @a[tag=SF_Placer,limit=1] SelectedItem.tag.energy.storage
tag @s remove SF_SetNew
