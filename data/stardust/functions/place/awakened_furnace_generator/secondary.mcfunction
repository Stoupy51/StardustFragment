
function stardust:place/block_tags
item replace entity @s container.0 with deepslate{CustomModelData:2013329}
tag @s add simplenergy.rotable
tag @s add stardust.awakened_stardust_furnace_generator
tag @s add stardust.destroy_furnace
tag @s add energy.send

scoreboard players set @s energy.max_storage 1600
scoreboard players operation @s energy.transfer_rate = @s energy.max_storage
scoreboard players add @s energy.storage 0
scoreboard players add @s energy.change_rate 0

# Call on a new machine to initialize its connections
function energy:v1/api/init_machine

