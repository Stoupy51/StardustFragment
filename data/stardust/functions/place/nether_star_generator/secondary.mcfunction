
function stardust:place/block_tags
data modify entity @s Item set value {id:"deepslate",Count:1b,tag:{CustomModelData:2013318}}
tag @s add stardust.destroy_furnace
tag @s add stardust.nether_star_generator
tag @s add simplenergy.rotable
tag @s add energy.send

scoreboard players set @s energy.max_storage 30000
scoreboard players operation @s energy.transfer_rate = @s energy.max_storage
scoreboard players add @s energy.storage 0
scoreboard players add @s energy.change_rate 0
#Call on a new machine to initialize its connections
function energy:v1/api/init_machine
