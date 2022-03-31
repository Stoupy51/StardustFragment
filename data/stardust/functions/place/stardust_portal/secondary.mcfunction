
scoreboard players set @s energy.max_storage 6000
scoreboard players operation @s energy.transfer_rate = @s energy.max_storage
scoreboard players set @s energy.storage 0
tag @s remove stardust.set_new
#Call on a new machine to initialize its connections
function energy:v1/api/init_machine
