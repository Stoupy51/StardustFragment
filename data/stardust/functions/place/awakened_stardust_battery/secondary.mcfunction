
function stardust:place/block_tags
data modify entity @s Item set value {id:"deepslate",Count:1b,tag:{CustomModelData:2013337}}
tag @s add simplenergy.balancing
tag @s add stardust.awakened_stardust_battery
tag @s add stardust.destroy_redstone_block
tag @s add energy.receive
tag @s add energy.send

execute store result score @s energy.max_storage run data get entity @a[tag=stardust.placer,limit=1] SelectedItem.tag.energy.max_storage
scoreboard players operation @s energy.transfer_rate = @s energy.max_storage
execute store result score @s energy.storage run data get entity @a[tag=stardust.placer,limit=1] SelectedItem.tag.energy.storage
#Call on a new machine to initialize its connections
function energy:v1/api/init_machine
