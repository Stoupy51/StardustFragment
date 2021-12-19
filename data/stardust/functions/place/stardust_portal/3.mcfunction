scoreboard players set @s energy.max_storage 6000
scoreboard players operation @s energy.transfer_rate = @s energy.max_storage
scoreboard players set @s energy.storage 0
tag @s remove SF_SetNew
