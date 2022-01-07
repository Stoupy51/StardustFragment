scoreboard players set @s energy.max_storage 20000
scoreboard players operation @s energy.transfer_rate = @s energy.max_storage
execute store result score @s energy.storage run data get entity @a[tag=StardustFragment_Placer,limit=1] SelectedItem.tag.energy.storage
tag @s remove StardustFragment_SetNew
#Call on a new machine to initialize its connections
function energy:v1/api/init_machine
