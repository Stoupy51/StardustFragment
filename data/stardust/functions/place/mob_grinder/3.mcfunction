scoreboard players set @s energy.max_storage 15000
scoreboard players operation @s energy.transfer_rate = @s energy.max_storage
scoreboard players add @s energy.storage 0
tag @s remove SF_SetNew
