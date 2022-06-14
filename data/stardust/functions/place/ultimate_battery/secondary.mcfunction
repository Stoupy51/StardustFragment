
function stardust:place/block_tags
item replace entity @s container.0 with deepslate{CustomModelData:2013338}
tag @s add simplenergy.balancing
tag @s add stardust.ultimate_battery
tag @s add stardust.destroy_crying_obsidian
tag @s add energy.receive
tag @s add energy.send

execute store result score @s energy.max_storage run data get entity @a[tag=stardust.placer,limit=1] SelectedItem.tag.energy.max_storage
scoreboard players operation @s energy.transfer_rate = @s energy.max_storage
execute store result score @s energy.storage run data get entity @a[tag=stardust.placer,limit=1] SelectedItem.tag.energy.storage
#Call on a new machine to initialize its connections
function energy:v1/api/init_machine
