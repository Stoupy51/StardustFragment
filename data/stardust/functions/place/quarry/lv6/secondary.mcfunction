
function stardust:place/block_tags
item replace entity @s container.0 with deepslate{CustomModelData:2013305,Enchantments:[{lvl:0,id:"minecraft:protection"}]}
tag @s add stardust.destroy_barrel
tag @s add stardust.quarry
tag @s add stardust.quarry_lv6
tag @s add stardust.tick_2_glows
tag @s add stardust.forceload
tag @s add global.forceload
tag @s add energy.receive

scoreboard players set @s energy.max_storage 1
scoreboard players operation @s energy.transfer_rate = @s energy.max_storage
execute store result score @s energy.storage run data get entity @a[tag=stardust.placer,limit=1] SelectedItem.tag.energy.storage
#Call on a new machine to initialize its connections
function energy:v1/api/init_machine
