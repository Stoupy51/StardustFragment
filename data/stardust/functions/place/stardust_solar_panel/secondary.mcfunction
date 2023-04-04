
function stardust:place/block_tags
item replace entity @s container.0 with deepslate{CustomModelData:2013331}
tag @s add simplenergy.balancing
tag @s add stardust.solar_panel
tag @s add stardust.stardust_solar_panel
tag @s add stardust.destroy_daylight_detector
tag @s add energy.send

# Item display brightness and scale
data remove entity @s brightness
data modify entity @s transformation.scale[1] set value 1.025f
data modify entity @s transformation.translation[1] set value 0.01f

scoreboard players set @s energy.max_storage 800
scoreboard players operation @s energy.transfer_rate = @s energy.max_storage
scoreboard players add @s energy.storage 0
scoreboard players add @s energy.change_rate 0

# Call on a new machine to initialize its connections
function energy:v1/api/init_machine

