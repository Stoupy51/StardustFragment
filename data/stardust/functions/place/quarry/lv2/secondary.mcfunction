
function stardust:place/block_tags
data modify entity @s Item set value {id:"deepslate",Count:1b,tag:{CustomModelData:2013301}}
tag @s add stardust.destroy_barrel
tag @s add stardust.quarry
tag @s add stardust.quarry_lv2
tag @s add stardust.tick_2_glows
tag @s add stardust.forceload
tag @s add global.forceload
tag @s add energy.receive

scoreboard players set @s energy.max_storage 60000
scoreboard players operation @s energy.transfer_rate = @s energy.max_storage
execute store result score @s energy.storage run data get entity @a[tag=stardust.placer,limit=1] SelectedItem.tag.energy.storage
#Call on a new machine to initialize its connections
function energy:v1/api/init_machine
