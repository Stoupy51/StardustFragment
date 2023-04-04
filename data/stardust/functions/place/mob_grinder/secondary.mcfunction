
function stardust:place/block_tags
item replace entity @s container.0 with deepslate{CustomModelData:2013314}
tag @s add stardust.destroy_cobbled_deepslate
tag @s add stardust.mob_grinder
tag @s add simplenergy.rotable
tag @s add energy.receive

scoreboard players set @s energy.max_storage 15000
scoreboard players operation @s energy.transfer_rate = @s energy.max_storage
scoreboard players add @s energy.storage 0
scoreboard players add @s energy.change_rate 0

# Call on a new machine to initialize its connections
function energy:v1/api/init_machine

