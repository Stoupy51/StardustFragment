
function stardust:place/block_tags
item replace entity @s container.0 with deepslate{CustomModelData:2013313}
tag @s add stardust.portal
tag @s add stardust.ultimate_portal
tag @s add stardust.destroy_crying_obsidian
tag @s add stardust.tick_2_glows
tag @s add energy.receive

execute if score #infinite stardust.data matches 1 run tag @s add stardust.infinite_energy

scoreboard players set @s energy.max_storage 24000
scoreboard players operation @s energy.transfer_rate = @s energy.max_storage
scoreboard players set @s energy.storage 0
#Call on a new machine to initialize its connections
function energy:v1/api/init_machine
