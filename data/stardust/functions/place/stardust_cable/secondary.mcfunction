
function stardust:place/block_tags
data modify entity @s Item set value {id:"cobblestone",Count:1b,tag:{CustomModelData:2013400}}
tag @s add stardust.destroy_player_head
tag @s add stardust.stardust_cable
tag @s add simplenergy.cable
tag @s add energy.cable

scoreboard players set @s energy.transfer_rate 600
#Call on a new cable to initialize its connections
function energy:v1/api/init_cable
