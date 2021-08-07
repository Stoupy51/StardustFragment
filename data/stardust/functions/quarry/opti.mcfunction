scoreboard players add Quarry SF_Data 1
#Select Zone
	scoreboard players set @a[distance=3..15] SF_EditQ -2
	scoreboard players add @a[distance=..3,gamemode=!spectator] SF_EditQ 1
	execute if entity @p[distance=..3] run function stardust:quarry/select
#Display
	execute if score @s SF_Data matches 1 run function stardust:quarry/display/all
execute if score @s SF_StatQ matches 1.. run function stardust:quarry/working
forceload add ~-3 ~-3 ~3 ~3
