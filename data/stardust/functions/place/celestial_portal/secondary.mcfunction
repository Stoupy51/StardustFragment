
function stardust:place/block_tags
data modify entity @s Item set value {id:"deepslate",Count:1b,tag:{CustomModelData:2013307}}
tag @s add stardust.portal
tag @s add stardust.celestial_portal
tag @s add stardust.destroy_iron_block
tag @s add stardust.tick_2_glows
tag @s add energy.receive

execute if score #infinite stardust.data matches 1 run tag @s add stardust.infinite_energy

scoreboard players set @s energy.max_storage 800
scoreboard players operation @s energy.transfer_rate = @s energy.max_storage
scoreboard players set @s energy.storage 0
#Call on a new machine to initialize its connections
function energy:v1/api/init_machine
